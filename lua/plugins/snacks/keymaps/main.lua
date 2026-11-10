--
-- Main
--
vim.keymap.set("n", "<leader><space>", function()
    Snacks.picker.smart()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>/", function()
    Snacks.picker.grep({
        regex = false,
        ignored = true,
        args = { "-i" },
    })
end, { desc = "Search" })

vim.keymap.set("n", "/", function()
    Snacks.picker.lines({
        layout = "dropdown",
    })
end, { desc = "Search Current File" })

vim.keymap.set("n", "<leader>:", function()
    Snacks.picker.command_history({ layout = "select" })
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
