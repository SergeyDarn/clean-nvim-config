require("noice").setup({
    presets = {
        command_palette = true,
        lsp_doc_border = true,
    },
    -- Disable all LSP changes that I DON'T WANT
    -- THIS IS A UI PLUGIN WTF ARE YOU DOING DEV
    lsp = {
        progress = {
            enabled = false,
        },
        override = {},
        hover = {
            enabled = false,
        },
        signature = {
            auto_open = {
                enabled = false,
                -- Automatically show signature help when typing a trigger character from the LSP
                trigger = false,
                -- Will open signature help when jumping to Luasnip insert nodes
                luasnip = false,
                -- Will open when jumping to placeholders in snippets (Neovim builtin snippets)
                snipppets = false,
            },
        },
        documentation = {
            opts = {
                replace = false,
            },
        },
    },
    health = {
        checker = false, -- Disable if you don't want health checks to run
    },
})
