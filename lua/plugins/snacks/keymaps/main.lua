--
-- Main
--
vim.keymap.set("n", "<leader><space>", function()
    Snacks.picker.smart()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>/", function()
    Snacks.picker.grep({ regex = false })
end, { desc = "Search" })

vim.keymap.set("n", "/", function()
    Snacks.picker.lines({
        layout = "telescope",
    })
end, { desc = "Search Current File" })

vim.keymap.set("n", "<leader>:", function()
    Snacks.picker.command_history()
end, { desc = "Command History" })

vim.keymap.set("n", "<leader>.", function()
    Snacks.scratch.open()
end, { desc = "Notes" })

--
-- Notifications
--
vim.keymap.set("n", "<leader>n", function()
    Snacks.picker.notifications()
end, { desc = "Notification History" })

--
-- File Explorer
--
vim.keymap.set("n", "<leader>e", function()
    Snacks.explorer()
end, { desc = "Toggle File Explorer" })
