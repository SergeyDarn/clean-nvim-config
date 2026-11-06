local chainsaw = require("chainsaw")

chainsaw.setup({})

vim.keymap.set("n", "<leader>ll", function()
    chainsaw.variableLog()
end, { desc = "Log Variable" })

vim.keymap.set("n", "<leader>lo", function()
    chainsaw.objectLog()
end, { desc = "Log Object" })

vim.keymap.set("n", "<leader>ls", function()
    chainsaw.emojiLog()
end, { desc = "Log Simple" })

vim.keymap.set("n", "<leader>lt", function()
    chainsaw.timeLog()
end, { desc = "Log Measure Time" })
