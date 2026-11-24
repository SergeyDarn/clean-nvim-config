local Colorscheme = require("plugins.ui.Colorscheme")

local bubbles_theme = {
    normal = {
        a = { fg = Colorscheme.colors.BLACK, bg = Colorscheme.colors.BLUE, gui = "bold" },
        c = { fg = Colorscheme.colors.WHITE },
        y = { bg = Colorscheme.colors.GREY },
    },

    insert = { a = { fg = Colorscheme.colors.BLACK, bg = Colorscheme.colors.GREEN, gui = "bold" } },
    visual = { a = { fg = Colorscheme.colors.BLACK, bg = Colorscheme.colors.PURPLE, gui = "bold" } },
    command = { a = { fg = Colorscheme.colors.BLACK, bg = Colorscheme.colors.PEACH, gui = "bold" } },

    inactive = {
        a = { fg = Colorscheme.colors.WHITE, bg = Colorscheme.colors.BLACK },
        c = { fg = Colorscheme.colors.WHITE },
        y = { bg = Colorscheme.colors.GREY },
    },
}

require("lualine").setup({
    options = {
        theme = bubbles_theme,
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
        lualine_b = {
            {
                function()
                    local fg = Colorscheme.colors.WHITE
                    local bg = Colorscheme.colors.GREY

                    if vim.bo.modified then
                        fg = Colorscheme.colors.YELLOW
                    end

                    vim.cmd("hi! lualine_filename_status guifg=" .. fg .. " guibg=" .. bg)

                    return "%t"
                end,
                color = "lualine_filename_status",
                separator = { right = "" },
            },
        },
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
