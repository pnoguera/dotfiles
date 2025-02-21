-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Keymap for Markdown links
vim.keymap.set("v", "<leader>ml", 'c[<C-r>"]()<Esc>', { desc = "[P]Markdown: insert link)" })
vim.keymap.set("n", "<leader>ml", 'ciw[<C-r>"]()<Esc>', { desc = "[P]Markdown: insert link)" })
vim.keymap.set("v", "<leader>mk", 'c[<C-r>"](<Esc>"+pli)<Esc>', { desc = "[P]Markdown: insert link from clipboard)" })
vim.keymap.set("n", "<leader>mk", 'ciw[<C-r>"](<Esc>"+pli)<Esc>', { desc = "[P]Markdown: insert link from clipboard)" })
