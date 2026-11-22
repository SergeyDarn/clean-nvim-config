--
-- Main
--
vim.keymap.set("n", "<leader><space>", function()
    Snacks.picker.files()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>/", function()
    Snacks.picker.grep({
        regex = false,
        layout = "ivy_split",
        args = { "--trim" },
    })
end, { desc = "Search" })

vim.keymap.set("n", "<leader>so", function()
    Snacks.picker.grep({
        buffers = true,
        regex = false,
        layout = "ivy_split",
        args = { "--trim" },
    })
end, { desc = "Search in open buffers" })

vim.keymap.set("n", "/", function()
    Snacks.picker.lines({ layout = "ivy_split" })
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
    Snacks.picker.notifications({ layout = "ivy_split" })
end, { desc = "Notification History" })
