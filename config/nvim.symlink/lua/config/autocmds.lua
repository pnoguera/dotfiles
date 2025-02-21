-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Terraform
vim.api.nvim_create_autocmd("FileType", {
	pattern = "terraform",
	callback = function()
		-- Default options
		vim.opt.tabstop = 2 -- number of visual spaces per TAB
		vim.opt.softtabstop = 2 -- number of spacesin tab when editing
		vim.opt.shiftwidth = 2 -- insert 2 spaces on a tab

		-- Ensure 'tfdoc' is executable before setting up commands and mappings
		if vim.fn.executable("tfdoc") == 1 then
			vim.api.nvim_create_user_command("Tfdoc", function(args)
				vim.fn.system("tfdoc " .. args.args)
			end, { nargs = "*" })

			-- Normal mode mappings
			vim.api.nvim_set_keymap("n", "<Leader>tfr", ":Tfdoc <C-R><C-W><CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>tfd", ":Tfdoc -d <C-R><C-W><CR>", { noremap = true, silent = true })

			-- Visual mode mappings
			vim.api.nvim_set_keymap("x", "<Leader>tfr", 'y:Tfdoc <C-R>"<CR>', { noremap = true, silent = true })
			vim.api.nvim_set_keymap("x", "<Leader>tfd", 'y:Tfdoc -d <C-R>"<CR>', { noremap = true, silent = true })
		end

		-- Ensure 'terraform' is executable before setting up filetype-specific settings
		if vim.fn.executable("terraform") == 1 then
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "terraform",
				callback = function()
					-- Set the 'makeprg' option for terraform files
					vim.bo.makeprg = "terraform fmt -check -no-color -write=false %"

					-- Uncomment and modify 'errorformat' as needed
					-- vim.bo.errorformat = '%EError: %m,%C,%C on %f line %l:,%Z%m'
				end,
			})
		end
		local lspconfig = require("lspconfig")

		lspconfig.terraformls.setup({
			on_attach = function(client, bufnr)
				-- Disable semantic tokens for this LSP client
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})
	end,
})
