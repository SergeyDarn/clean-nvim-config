require("lualine").setup({
    options = {
        disabled_filetypes = {
            statusline = { "grug-far" },
        },
        component_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = { "branch" },
        lualine_b = { "searchcount" },
        lualine_c = { "filename", "diagnostics", "diff" },
        lualine_x = { "location" },
        lualine_y = { "filetype" },
        lualine_z = { "" },
    },
})
