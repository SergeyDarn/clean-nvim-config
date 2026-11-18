require("plugins.utils.mini")

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
require("early-retirement").setup({
    retirementAgeMins = 20,

    --
    -- Save and close buffers with unsaved changes
    --
    ignoreUnsavedChangesBufs = false,
    --
    -- Don't ignore last buffer (alternate file)
    --
    ignoreAltFile = false,
    --
    -- When a file is deleted, for example via an external program, delete the
    -- associated buffer as well. Requires Neovim >= 0.10.
    -- (This feature is independent from the automatic closing)
    --
    deleteBufferWhenFileDeleted = true,
})
