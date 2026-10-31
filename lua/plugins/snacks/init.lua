require("snacks").setup({
    notifier = { enabled = true },
    explorer = { enabled = true },
    scratch = {
        ft = "markdown",
        win = {
            width = 0.8,
            height = 0.8,
        },
    },
    lazygit = {
        win = {
            width = 100,
            height = 100,
        },
    },
    picker = {
        sources = {
            explorer = {
                auto_close = true,
                hidden = true,
                ignored = true,
                layout = {
                    preset = "default",
                    layout = {
                        min_width = 0,
                        width = 0.6,
                    },
                },
            },
        },
        layout = {
            preset = function()
                return "telescope"
            end,
        },
        layouts = require("plugins.snacks.layouts"),
    },
})

require("plugins.snacks.keymaps")
