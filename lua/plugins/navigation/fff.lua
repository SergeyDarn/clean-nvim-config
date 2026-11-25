local fff = require("fff")
local Colorscheme = require("Colorscheme")

require("fff").setup({
    title = "Find Files",
    lazy_sync = true,
    layout = {
        width = 1,
        height = 1,
        preview_size = 0.65,
    },
    prompt = "🍷 ",
    keymaps = {
        move_up = { "<C-k>", "<Up>" },
        move_down = { "<C-j>", "<Down>" },
        preview_scroll_up = "<C-p>",
    },
    git = {
        status_text_color = true,
    },
    debug = { enabled = true, show_scores = true },
})

Colorscheme:applyHighlights({
    FFFGitModified = { fg = Colorscheme.colors.YELLOW },
    FFFGitBorderSelected_modified = { fg = Colorscheme.colors.YELLOW },
    FFFGitSignModified = { fg = Colorscheme.colors.YELLOW },
    FFFGitSignModifiedSelected = { fg = Colorscheme.colors.YELLOW },

    FFFSelected = { fg = Colorscheme.colors.ACCENT },
    FFFSelectedActive = { fg = Colorscheme.colors.ACCENT },
    FFFFileInfoSection = { fg = Colorscheme.colors.ACCENT },
})

vim.keymap.set("n", "<leader><space>", function()
    fff.find_files()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>/", function()
    fff.live_grep({ grep = { modes = { "plain", "fuzzy" } } })
end, { desc = "Text" })

vim.keymap.set({ "n", "x" }, "<leader>sw", function()
    fff.live_grep_under_cursor()
end, { desc = "Word under cursor" })
