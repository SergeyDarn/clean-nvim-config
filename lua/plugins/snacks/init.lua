local layouts = require("plugins.snacks.layouts")

require("snacks").setup({
    notifier = { enabled = true },
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
        layout = {
            preset = function()
                return "dropdown"
            end,
        },
        layouts = layouts,
    },
})

require("plugins.snacks.keymaps")
