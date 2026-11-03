local utils = require("utils")

require("arrow").setup({
    show_icons = true,
    leader_key = ";", -- Recommended to be a single key
    -- Marks replacement
    buffer_leader_key = "m",
    global_bookmarks = true,
    mappings = {
        edit = "E",
        prev_item = "H",
        next_item = "L",
    },
    custom_actions = {
        split_vertical = utils.split_vertical,
    },
    window = {
        border = vim.g.border_type,
    },
})

local arrow = require("arrow.persist")

vim.keymap.set("n", "H", arrow.previous)
vim.keymap.set("n", "L", arrow.next)
