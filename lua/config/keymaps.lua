-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Switch between windows (mainly using it to switch betweenthe main window and File Explorer)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })

-- Quit all
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Plugins and Vim
vim.keymap.set("n", "<leader>vr", "<cmd>restart<CR>", { desc = "Restart Neovim" })
vim.keymap.set("n", "<leader>vu", vim.pack.update, { desc = "Update VimPack Plugins" })

vim.api.nvim_create_user_command("VimPackAdd", function(opts)
    vim.pack.add(opts.fargs)
end, { nargs = "+", desc = "Add VimPack Plugin" })

vim.api.nvim_create_user_command("VimPackDel", function(opts)
    vim.pack.del(opts.fargs)
end, { nargs = "+", desc = "Delete VimPack Plugin" })

vim.api.nvim_create_user_command("VimPackUpdate", function()
    vim.pack.update()
end, { desc = "Update VimPack Plugins" })
