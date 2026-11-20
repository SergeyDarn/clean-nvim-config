require("which-key").setup({
    delay = 300,
    preset = "modern",
    icons = { mappings = true },
    keys = {
        scroll_down = "<c-j>",
        scroll_up = "<c-k>",
    },
    spec = {
        { "<leader>c", group = "Code", mode = { "n", "v" } },
        { "<leader>g", group = "Git", mode = { "n", "v" } },
        { "<leader>s", group = "Search", mode = { "n", "v" } },
        { "<leader>l", group = "Logging", mode = { "n", "v" }, icon = "󰯂" },
        { "<leader>v", group = "Neovim", mode = { "n", "v" }, icon = "" },
        { "<leader>q", group = "Exit", mode = { "n", "v" } },
        { "<leader>w", group = "Windows", mode = { "n", "v" } },
        { "<leader>?", group = "Neovim Tips", mode = { "n", "v" }, icon = "" },
        { "<leader>t", group = "Trouble", mode = { "n", "v" }, icon = "" },
        { "<leader>m", group = "Markdown", mode = { "n", "v" }, icon = "" },
    },
})
