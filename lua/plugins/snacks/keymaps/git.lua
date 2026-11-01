--
-- Lazygit
--
vim.keymap.set("n", "<leader>gg", function()
    Snacks.lazygit({
        -- Use normal lazygit theme
        configure = false,
    })
end, { desc = "Lazygit" })

--
-- Git
--
vim.keymap.set("n", "<leader>gb", function()
    Snacks.picker.git_log_line({
        layout = "telescope",
    })
end, { desc = "Git Blame" })

vim.keymap.set("n", "<leader>gl", function()
    Snacks.picker.git_log_file({
        layout = "telescope",
    })
end, { desc = "Git File History" })

vim.keymap.set("n", "<leader>gh", function()
    Snacks.picker.git_log({
        layout = "telescope",
    })
end, { desc = "Git History" })

vim.keymap.set("n", "<leader>gs", function()
    Snacks.picker.git_status({
        layout = "telescope",
    })
end, { desc = "Git Status" })
