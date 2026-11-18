local actions = require("diffview.actions")

require("diffview").setup({
    view = {
        merge_tool = { layout = "diff3_vertical" },
    },
    file_panel = {
        listing_style = "tree",
        win_config = { position = "left", width = 25 },
    },
    keymaps = {
        diff3 = {
            {
                { "n", "x" },
                "gmt",
                actions.diffget("ours"),
                { desc = "Obtain the diff hunk from the OURS version of the file" },
            },
            {
                { "n", "x" },
                "gmb",
                actions.diffget("theirs"),
                { desc = "Obtain the diff hunk from the THEIRS version of the file" },
            },
        },
    },
})

vim.api.nvim_set_hl(0, "DiffviewDiffAdd", { bg = "#092B2B" })
vim.api.nvim_set_hl(0, "DiffviewDiffAddInline", { bg = "#054645" })
vim.api.nvim_set_hl(0, "DiffviewDiffDelete", { bg = "#331523" })
vim.api.nvim_set_hl(0, "DiffviewDiffDeleteInline", { bg = "#561F37" })
