--
-- More Search
--
vim.keymap.set("n", "<leader>sh", function()
    Snacks.picker.help()
end, { desc = "Help" })

vim.keymap.set("n", "<leader>se", function()
    Snacks.picker.diagnostics()
end, { desc = "Code Errors" })

vim.keymap.set("n", "<leader>sp", function()
    Snacks.picker.projects()
end, { desc = "Projects" })

vim.keymap.set("n", "<leader>sf", function()
    Snacks.picker.recent()
end, { desc = "Recent" })

vim.keymap.set("n", "<leader>si", function()
    Snacks.picker.icons()
end, { desc = "Icons" })

vim.keymap.set("n", "<leader>s.", function()
    Snacks.picker.scratch()
end, { desc = "Notes" })

vim.keymap.set("n", "<leader>st", function()
    Snacks.picker.todo_comments()
end, { desc = "Todos" })

vim.keymap.set("n", "<leader>z", function()
    Snacks.picker.zoxide()
end, { desc = "Zoxide" })

vim.keymap.set("n", "<leader>sl", function()
    local chainsawMarker = require("chainsaw.config.config").config.marker

    Snacks.picker.grep_word({
        title = chainsawMarker .. " log statements",
        cmd = "rg",
        args = { "--trim" },
        search = chainsawMarker,
        regex = false,
        live = false,
    })
end, { desc = "Logs" })
