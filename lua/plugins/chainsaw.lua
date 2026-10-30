require("chainsaw").setup({})

vim.keymap.set("n", "<leader>l", function()
    require("chainsaw").variableLog()
end, { desc = "Log variable" })
