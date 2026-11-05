require("mini.icons").setup({})
-- Used for backwards compatibility with plugins that require `nvim-web-devicons` (e.g. telescope.nvim)
MiniIcons.mock_nvim_web_devicons()

local mainKey = "z"

require("mini.surround").setup({
    mappings = {
        add = mainKey .. "a", -- Add surrounding in Normal and Visual modes
        delete = mainKey .. "d", -- Delete surrounding
        find = mainKey .. "f", -- Find surrounding (to the right)
        find_left = mainKey .. "F", -- Find surrounding (to the left)
        highlight = mainKey .. "h", -- Highlight surrounding
        replace = mainKey .. "r", -- Replace surrounding
    },
})
require("mini.ai").setup({
    search_method = "cover",
    custom_textobjects = {
        -- Change bracket text object to not remove spaces
        ["b"] = { { "%b()", "%b[]", "%b{}" }, "^.%s*().-()%s*.$" },
    },
})

require("guess-indent").setup({})

require("rooter").setup({
    root_patterns = { ".git/", "go.mod", "config.toml", "package.json", "Makefile" },
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

require("tabout").setup({})

local undotree = require("undotree")
undotree.setup({})

vim.keymap.set("n", "<leader>u", function()
    undotree.toggle()
end, { desc = "Toggle Undo Tree" })
