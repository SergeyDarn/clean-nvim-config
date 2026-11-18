require("toggleterm").setup({
    size = nil,
    direction = "float",
    open_mapping = [[G]],
    insert_mappings = false,
    float_opts = {
        border = vim.g.border_type,
    },
    highlights = {
        FloatBorder = {
            guifg = "#454759",
        },
    },
})
