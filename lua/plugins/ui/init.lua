require("catppuccin").setup({
    flavour = "mocha",
})
vim.cmd.colorscheme("catppuccin-nvim")

require("lualine").setup({
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "searchcount" },
        lualine_c = { "location", "diagnostics" },
        lualine_x = { "diff" },
        lualine_y = { "filetype" },
        lualine_z = { "filename" },
    },
})

require("toggleterm").setup({
    size = nil,
    direction = "float",
    open_mapping = [[<leader>t]],
    insert_mappings = false,
    float_opts = {
        border = "curved",
        width = 65,
        height = 15,
    },
})

require("which-key").setup({
    delay = 300,
    icons = { mappings = true },
    -- Document existing key chains
    spec = {
        { "<leader>c", group = "Code", mode = { "n", "v" } },
        { "<leader>g", group = "Git", mode = { "n", "v" } },
        { "<leader>s", group = "Search", mode = { "n", "v" } },
        { "<leader>v", group = "Vim", mode = { "n", "v" } },
        { "<leader>q", group = "Exit", mode = { "n", "v" } },
    },
})

require("plugins.ui.noice")

require("todo-comments").setup({
    keywords = {
        FIX = {
            -- icon used for the sign, and in search results
            icon = " ",
            -- can be a hex color, or a named color (see below)
            color = "error",
            -- a set of other keywords that all map to this FIX keywords
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = { icon = " ", color = "info" },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    color = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
    },
})
