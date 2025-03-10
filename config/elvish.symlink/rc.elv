use path
use epm

# install elvish modules
epm:install &silent-if-installed ^
    github.com/zzamboni/elvish-themes ^
    github.com/muesli/elvish-libs ^
    github.com/zzamboni/elvish-modules/dir

### Config
set edit:insert:binding[Alt-Backspace] = $edit:kill-small-word-left~
# instant preview mode
set edit:insert:binding[Alt-m] = $edit:-instant:start~
# limit history and location height
set edit:max-height = 20

#   eval (starship init elvish | sed 's/except/catch/')
# Temporary fix for use of except in the output of the Starship init code
eval (~/bin/starship init elvish --print-full-init | slurp)

# Where all the Go stuff is
if (path:is-dir ~/Dropbox/Personal/devel/go) {
  set E:GOPATH = ~/Dropbox/Personal/devel/go
} else {
  set E:GOPATH = ~/go
}

# Optional paths, add only those that exist
var optpaths = [
  /usr/local/go/bin
  ~/Work/automated-security-helper
  ~/.toolbox/bin
]
var optpaths-filtered = [(each {|p|
      if (path:is-dir $p) { put $p }
} $optpaths)]

set paths = [
  ~/bin
  $E:GOPATH/bin
  $@optpaths-filtered
  /usr/local/bin
  /usr/local/sbin
  /usr/sbin
  /sbin
  /usr/bin
  /bin
]

# Aliases
fn ls {|@a| e:ls --color $@a }
fn k {|@a| e:kubectl --context $@a }
fn wo {|| e:workon (path:base $E:PWD) }
fn weather { || curl http://wttr.in/Berlin }
