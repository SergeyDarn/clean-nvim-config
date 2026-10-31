require("catppuccin").setup({
    flavour = "mocha",
})
vim.cmd.colorscheme("catppuccin-nvim")

require("lualine").setup({
    options = {
        disabled_filetypes = {
            statusline = { "grug-far" },
        },
        component_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = { "branch" },
        lualine_b = { "searchcount" },
        lualine_c = { "filename", "diagnostics", "diff" },
        lualine_x = { "location" },
        lualine_y = { "filetype" },
        lualine_z = { "" },
    },
})

require("toggleterm").setup({
    size = nil,
    direction = "float",
    open_mapping = [[<leader>t]],
    insert_mappings = false,
    float_opts = {
        border = "curved",
        width = 65,
        height = 15,
    },
})

require("which-key").setup({
    delay = 300,
    icons = { mappings = true },
    -- Document existing key chains
    spec = {
        { "<leader>c", group = "Code", mode = { "n", "v" } },
        { "<leader>g", group = "Git", mode = { "n", "v" } },
        { "<leader>s", group = "Search", mode = { "n", "v" } },
        { "<leader>v", group = "Neovim", mode = { "n", "v" } },
        { "<leader>q", group = "Exit", mode = { "n", "v" } },
        { "<leader>?", group = "Neovim Tips", mode = { "n", "v" } },
    },
})

require("plugins.ui.noice")
require("plugins.ui.todo_comments")
