return {
	'saghen/blink.cmp',
	opts = {
		sources = {
			 -- Add 'dictionary' to the list
			-- default = function(ctx)
			--   local success, node = pcall(vim.treesitter.get_node)
			--   if vim.bo.filetype == 'markdown' then
			-- 	return { 'dictionary', 'lsp', 'path' }
			--   elseif success and node and vim.tbl_contains({ 'comment', 'line_comment', 'block_comment' }, node:type()) then
			-- 	return { 'buffer' }
			--   else
			-- 	return { 'dictionary', 'lsp', 'path', 'snippets', 'buffer' }
			--   end
			-- end,
			-- default = { 'dictionary', 'lsp', 'path', 'snippets', 'buffer' }
			min_keyword_length = 5,
		}
	}
}
