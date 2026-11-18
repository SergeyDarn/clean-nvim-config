require("plugins.utils.mini")
require("plugins.utils.early-retirement")

require("guess-indent").setup({})

require("rooter").setup({
    root_patterns = { ".git/", "go.mod", "config.toml", "package.json", "Makefile" },
    outermost = false,
})

require("comfy-line-numbers").setup({})

require("gitsigns").setup({
    signs = {
        delete = {
            text = "x",
        },
    },
    signs_staged = {
        delete = {
            text = "x",
        },
    },
})

require("plugins.utils.yanky")

require("nvim-highlight-colors").setup({})

require("tabout").setup({
    ignore_beginning = false,
})

local undotree = require("undotree")
undotree.setup({})

vim.keymap.set("n", "<leader>u", function()
    undotree.toggle()
end, { desc = "Toggle Undo Tree" })
