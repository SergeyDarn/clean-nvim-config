require("which-key").setup({
    delay = 300,
    icons = { mappings = true },
    -- Document existing key chains
    spec = {
        { "<leader>c", group = "Code", mode = { "n", "v" } },
        { "<leader>g", group = "Git", mode = { "n", "v" } },
        { "<leader>s", group = "Search", mode = { "n", "v" } },
        { "<leader>v", group = "Neovim", mode = { "n", "v" }, icon = "" },
        { "<leader>q", group = "Exit", mode = { "n", "v" } },
        { "<leader>?", group = "Neovim Tips", mode = { "n", "v" }, icon = "" },
    },
})
