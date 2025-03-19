return {
	{
		"git@gitlab.com:gitlab-org/editor-extensions/gitlab.vim.git",
		-- Activate when a file is created/opened
		event = { "BufReadPre", "BufNewFile" },
		-- Activate when a supported filetype is open
		ft = { "go", "javascript", "python", "ruby" },
		-- In your lazy plugin spec file, e.g., lua/plugins/gitlab.lua
		config = function()
			local function read_gitlab_token()
				local token_file = vim.fn.expand("~/.nvim-gitlab")

				-- Check if file exists
				print("Finding file")
				if vim.fn.filereadable(token_file) == 1 then
					print("File found")
					-- Read the file content (first line only)
					local lines = vim.fn.readfile(token_file, "", 1)
					if #lines > 0 then
						-- Remove any whitespace/newlines
						return vim.fn.trim(lines[1])
					end
				end

				-- Fallback to environment variable if file not found
				return vim.fn.getenv("GITLAB_TOKEN")
			end

			-- Set the GitLab token for the plugin
			vim.g.gitlab_token = read_gitlab_token()

			-- Any other plugin-specific configuration you want to add
		end,
		cond = function()
			-- Only activate if token is present in environment variable.
			-- Remove this line to use the interactive workflow.
			-- Set from file usually
			-- return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ""
			return true
		end,
		opts = {
			gitlab_url = "https://git.flix.tech",
			statusline = {
				-- Hook into the built-in statusline to indicate the status
				-- of the GitLab Duo Code Suggestions integration
				enabled = true,
			},
			code_suggestions = {
				-- For the full list of default languages, see the 'auto_filetypes' array in
				-- https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim/-/blob/main/lua/gitlab/config/defaults.lua
				auto_filetypes = { "ruby", "javascript", "go", "python" }, -- Default is { 'ruby' }
				ghost_text = {
					enabled = true,
					toggle_enabled = "<C-h>",
					accept_suggestion = "<C-l>",
					clear_suggestions = "<C-k>",
					stream = true,
				},
			},
			resource_editing = {
				enabled = true,
			},
		},
	},
}
