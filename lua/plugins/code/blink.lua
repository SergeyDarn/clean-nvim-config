require("blink.cmp").setup({
    keymap = {
        -- See `:help blink-cmp-config-keymap` for defining your own keymap
        preset = "enter",

        ["<C-j>"] = { "select_next" },
        ["<C-k>"] = { "select_prev" },
        -- <C-e>: Hide menu
        ["<C-o>"] = {
            function(cmp)
                cmp.show()
            end,
        },
        ["<C-y>"] = {
            function(cmp)
                cmp.accept()
            end,
        },
        ["<C-d>"] = {
            function(cmp)
                cmp.show_documentation()
            end,
        },
    },

    completion = {
        documentation = { auto_show = false },
        menu = { auto_show = true },
        ghost_text = { enabled = true },
    },

    sources = {
        default = { "lsp", "path", "snippets" },
    },

    -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
    -- which automatically downloads a prebuilt binary when enabled.
    --
    -- By default, we use the Lua implementation instead, but you may enable
    -- the rust implementation via `'prefer_rust_with_warning'`
    --
    -- See `:help blink-cmp-config-fuzzy` for more information
    fuzzy = { implementation = "prefer_rust_with_warning" },

    -- Shows a signature help window while you type arguments for a function
    signature = {
        enabled = true,
        trigger = {
            enabled = true,
            show_on_accept = true,
        },
        window = {
            show_documentation = false,
        },
    },
})
