require("yanky").setup({
    ring = {
        storage = "sqlite",
    },
    picker = {
        select = {
            action = nil, -- uses default put action
        },
    },
    highlight = {
        timer = 300,
    },
})

vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")

vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")

vim.keymap.set("n", "<leader>y", function()
    Snacks.picker.yanky()
end, { desc = "Yanky Clipboard" })
