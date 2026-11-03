local arena = require("arena")
local utils = require("utils")

arena.setup({
    ignore_current = true,
    buf_options = {},
    always_context = {
        "go.mod",
        "main.go",
        "package.json",
        "init.lua",
        "config.toml",
        "README.md",
    },
    keybinds = {
        ["v"] = function(win)
            local buffer_name = vim.fn.bufname(win:current().bufnr)

            utils.split_vertical(buffer_name)
        end,
    },
    algorithm = {
        recency_factor = 1,
        frequency_factor = 0.5,
    },
})

vim.keymap.set("n", "<leader>a", function()
    arena.toggle()
end, { desc = "Arena", noremap = true })
