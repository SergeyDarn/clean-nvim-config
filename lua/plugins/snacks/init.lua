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
        configure = false,
        win = {
            width = 0,
            height = 0,
        },
    },
    picker = {
        layout = {
            preset = function()
                return "telescope"
            end,
        },
        sources = {
            grep = {
                --
                -- Show matched line text first, before the filename
                --
                format = function(item, picker)
                    local res = {}

                    if item.line then
                        Snacks.picker.highlight.format(item, item.line, res)
                        res[#res + 1] = { "  " }
                    end

                    --
                    -- Highlight matched text
                    --
                    if item.positions then
                        Snacks.picker.highlight.matches(res, item.positions)
                    end

                    vim.list_extend(res, Snacks.picker.format.filename(item, picker))

                    return res
                end,
            },
        },
        layouts = layouts,
        formatters = {
            file = {
                --
                -- Show filename before the fullpath in searches
                --
                filename_first = true,
            },
        },
    },
})

require("plugins.snacks.keymaps")
