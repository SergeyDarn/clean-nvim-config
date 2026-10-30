require("mini.icons").setup({})
-- Used for backwards compatibility with plugins that require `nvim-web-devicons` (e.g. telescope.nvim)
MiniIcons.mock_nvim_web_devicons()

require("mini.surround").setup({})
require("mini.ai").setup({})

require("guess-indent").setup({})

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
