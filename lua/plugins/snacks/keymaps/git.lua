--
-- Lazygit
--
vim.keymap.set("n", "<leader>gg", function()
    Snacks.lazygit()
end, { desc = "Lazygit" })

--
-- Git
--
vim.keymap.set("n", "<leader>gb", function()
    Snacks.picker.git_log_line()
end, { desc = "Git Blame" })

vim.keymap.set("n", "<leader>gl", function()
    Snacks.picker.git_log_file()
end, { desc = "Git File History" })

vim.keymap.set("n", "<leader>gd", function()
    Snacks.picker.git_diff()
end, { desc = "Git Diff" })
