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
