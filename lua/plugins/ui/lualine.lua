local Colorscheme = require("plugins.ui.Colorscheme")

local bubbles_theme = {
    normal = {
        a = { fg = Colorscheme.colors.BLACK, bg = Colorscheme.colors.BLUE, gui = "bold" },
        b = { fg = Colorscheme.colors.WHITE, bg = Colorscheme.colors.GREY },
        c = { fg = Colorscheme.colors.WHITE },
    },

    insert = { a = { fg = Colorscheme.colors.BLACK, bg = Colorscheme.colors.GREEN, gui = "bold" } },
    visual = { a = { fg = Colorscheme.colors.BLACK, bg = Colorscheme.colors.PURPLE, gui = "bold" } },
    command = { a = { fg = Colorscheme.colors.BLACK, bg = Colorscheme.colors.PEACH, gui = "bold" } },

    inactive = {
        a = { fg = Colorscheme.colors.WHITE, bg = Colorscheme.colors.BLACK },
        b = { fg = Colorscheme.colors.WHITE, bg = Colorscheme.colors.BLACK },
        c = { fg = Colorscheme.colors.WHITE },
    },
}

require("lualine").setup({
    options = {
        theme = bubbles_theme,
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = { "grug-far" },
        },
        component_separators = "",
    },
    sections = {
        lualine_a = {
            {
                "branch",
                separator = { left = " " },
                right_padding = 2,
            },
        },
        lualine_b = { "filename" },
        lualine_c = { "diagnostics", "diff" },
        lualine_x = { "location" },
        lualine_y = {
            {
                "filetype",
                separator = { left = "", right = "" },
                left_padding = 2,
            },
        },
        lualine_z = { "" },
    },
})
