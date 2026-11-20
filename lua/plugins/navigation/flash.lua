require("flash").setup({})

vim.keymap.set({ "n", "x", "o" }, "f", function()
    require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set({ "o" }, "r", function()
    require("flash").remote()
end, { desc = "Flash Remote" })
