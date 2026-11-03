require("toggleterm").setup({
    size = nil,
    direction = "float",
    open_mapping = [[<leader>t]],
    insert_mappings = false,
    float_opts = {
        border = vim.g.border_type,
        width = 65,
        height = 15,
    },
    highlights = {
        FloatBorder = {
            guifg = "#454759",
        },
    },
})
