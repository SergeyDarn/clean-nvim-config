local actions = require("diffview.actions")

require("diffview").setup({
    file_panel = {
        listing_style = "tree",
        win_config = { position = "left", width = 25 },
    },
    keymaps = {
        diff3 = {
            {
                { "n", "x" },
                "gml",
                actions.diffget("ours"),
                { desc = "Obtain the diff hunk from the OURS version of the file" },
            },
            {
                { "n", "x" },
                "gmr",
                actions.diffget("theirs"),
                { desc = "Obtain the diff hunk from the THEIRS version of the file" },
            },
        },
    },
})
