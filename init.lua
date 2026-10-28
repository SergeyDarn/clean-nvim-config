--
-- Enable faster startup by caching compiled Lua modules
--
vim.loader.enable()

local function gh(repo)
    return "https://github.com/" .. repo
end

--
-- Load configs
--
require("config.options")
require("config.autocmds")
require("config.keymaps")

--
-- Icons
--
vim.pack.add({ gh("nvim-mini/mini.icons") })
require("mini.icons").setup({})
-- Used for backwards compatibility with plugins that require `nvim-web-devicons` (e.g. telescope.nvim)
MiniIcons.mock_nvim_web_devicons()

--
-- Add/delete/replace surroundings (brackets, quotes, etc.)
--
vim.pack.add({ gh("nvim-mini/mini.surround") })
require("mini.surround").setup({})

--
-- Theme
--
vim.pack.add({ { src = gh("catppuccin/nvim"), name = "catppuccin" } })

require("catppuccin").setup({
    flavour = "mocha",
})
vim.cmd.colorscheme("catppuccin-nvim")

--
-- Status line at the bottom
--
vim.pack.add({ gh("nvim-lualine/lualine.nvim") })
require("lualine").setup({
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "searchcount" },
        lualine_c = { "location", "diagnostics" },
        lualine_x = { "diff" },
        lualine_y = { "filetype" },
        lualine_z = { "filename" },
    },
})

--
-- Change UI for cmdline+search
-- (also should affect notifications and popupmenu in theory, but I don't think it does)
--
vim.pack.add({
    gh("MunifTanjim/nui.nvim"),
    gh("folke/noice.nvim"),
})
require("noice").setup({
    presets = {
        command_palette = true,
    },
})

--
-- Snacks
--
vim.pack.add({ gh("folke/snacks.nvim") })
require("plugins.snacks")

--
-- Grapple
--
vim.pack.add({ gh("cbochs/grapple.nvim") })
require("plugins.grapple")

--
-- Automatic indentation style detection for the file
--
vim.pack.add({ gh("NMAC427/guess-indent.nvim") })
require("guess-indent").setup({})

--
-- Treesitter (code syntax highlight)
--
vim.pack.add({ { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" } })
require("plugins.treesitter")

--
-- LSP
--
vim.pack.add({
    -- Status updates of the progress bar in te rigt corder
    gh("j-hui/fidget.nvim"),

    gh("neovim/nvim-lspconfig"),

    -- Automatic lsp servers installation
    gh("mason-org/mason.nvim"),
    gh("mason-org/mason-lspconfig.nvim"),
    gh("WhoIsSethDaniel/mason-tool-installer.nvim"),
})
require("plugins.lsp")

--
-- Code formatting
--
vim.pack.add({ gh("stevearc/conform.nvim") })
require("plugins.conform")

--
-- Show pending keybinds
--
vim.pack.add({ gh("folke/which-key.nvim") })
require("which-key").setup({
    delay = 300,
    icons = { mappings = true },
    -- Document existing key chains
    spec = {
        { "<leader>c", group = "Code", mode = { "n", "v" } },
        { "<leader>g", group = "Git", mode = { "n", "v" } },
        { "<leader>s", group = "Search", mode = { "n", "v" } },
        { "<leader>v", group = "Vim", mode = { "n", "v" } },
        { "<leader>q", group = "Exit", mode = { "n", "v" } },
    },
})

--
-- Show git diff in files inline (+ lots of other features I don't use)
--
vim.pack.add({ gh("lewis6991/gitsigns.nvim") })
require("gitsigns").setup({
    signs = {
        delete = {
            text = "x",
        },
    },
    signs_staged = {
        delete = {
            text = "x",
        },
    },
})

--
-- Floating terminal (better UI/UX than the one in Snacks)
--
vim.pack.add({ gh("akinsho/toggleterm.nvim") })
require("toggleterm").setup({
    size = nil,
    direction = "float",
    open_mapping = [[<leader>t]],
    float_opts = {
        border = "curved",
        width = 65,
        height = 15,
    },
})
