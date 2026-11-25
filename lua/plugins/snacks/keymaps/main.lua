vim.keymap.set("n", "/", function()
    Snacks.picker.lines({ layout = "ivy_split" })
end, { desc = "Search Current File" })

vim.keymap.set("n", "<leader>:", function()
    Snacks.picker.command_history({ layout = "select" })
end, { desc = "Command History" })

vim.keymap.set("n", "<leader>.", function()
    Snacks.scratch.open()
end, { desc = "Notes" })

vim.keymap.set("n", "<leader>n", function()
    Snacks.picker.notifications({ layout = "ivy_split" })
end, { desc = "Notification History" })
