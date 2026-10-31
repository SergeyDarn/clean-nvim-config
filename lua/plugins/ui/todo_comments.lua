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
