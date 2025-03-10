return {
	"neovim/nvim-lspconfig",
	-- opts = {
		-- autoformat = false
	-- 	servers = {
	-- 		terraformls = {
	-- 			on_attach = function(client, bufnr)
	-- 				-- Disable semantic tokens for this LSP client
	-- 				client.server_capabilities.semanticTokensProvider = nil
	-- 			end,
	-- 		},
	-- 	},
	-- },
	-- config = function(_, opts)
	-- 	local lspconfig = require("lspconfig")
	-- 	for server, server_opts in pairs(opts.servers) do
	-- 		lspconfig[server].setup(server_opts)
	-- 	end
	-- end,
}
