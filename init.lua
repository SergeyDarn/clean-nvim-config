--
-- Enable faster startup by caching compiled Lua modules
--
vim.loader.enable()

local function gh(repo)
    return "https://github.com/" .. repo
end

--
-- Setting vim options + general keymaps, autocmds and user cmds
--
require("config")

--
-- Global plugins
--
vim.pack.add({
    --
    -- Convenient logging
    -- (it's here and not in the code section
    -- because it works for debugging neovim config)
    --
    gh("chrisgrieser/nvim-chainsaw"),

    --
    -- Lots of quality of life stuff and utils
    -- + dozens of useful pickers for searching basically anything (files, folders, git, neovim stuff - anything)
    -- (Snacks are inited at the begging because some other plugins might be dependant on them)
    --
    gh("folke/snacks.nvim"),
})
require("plugins.chainsaw")
require("plugins.snacks")

--
-- Utils
--
vim.pack.add({
    --
    -- Icons that many other plugins use
    --
    gh("nvim-mini/mini.icons"),

    --
    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    gh("nvim-mini/mini.surround"),
    -- Add textobjects: "q" for quote, "b" for brackets, "t" for tag
    gh("nvim-mini/mini.ai"),

    --
    -- Automatic indentation style detection for the file
    --
    gh("NMAC427/guess-indent.nvim"),

    --
    -- Set correct current working directory automatically
    -- when opening vim and when switching between projects
    --
    gh("wsdjeg/rooter.nvim"),

    --
    -- Change relative line numbers to only include numbers 1-5 for comfort
    --
    gh("mluders/comfy-line-numbers.nvim"),

    --
    -- Show git diff in files inline (+ lots of other features I don't use)
    --
    gh("lewis6991/gitsigns.nvim"),

    --
    -- Clipboard history + better yank
    -- (Sqlite for more reliable history storage)
    --
    gh("kkharji/sqlite.lua"),
    gh("gbprod/yanky.nvim"),

    --
    -- Mini-games to become better at Vim Motions
    --
    gh("szymonwilczek/vim-be-better"),

    --
    -- Show colors inline
    --
    gh("brenoprata10/nvim-highlight-colors"),

    --
    -- Conveniet plugin for tabing out of a quote or a bracket
    --
    gh("abecodes/tabout.nvim"),

    --
    -- Undo tree
    --
    gh("jiaoshijie/undotree"),

    --
    -- Automatically switch to english when in normal mode
    --
    gh("chojs23/im-switch.nvim"),

    --
    -- Close buffers after a certain amount of time
    --
    gh("chrisgrieser/nvim-early-retirement"),

    --
    -- Git diffviewer
    --- using it for interactively splitting commits with jj split
    --- (not using it for merge conflicts - because I like ec more for that)
    ---
    gh("dlyongemallo/diffview-plus.nvim"),
})
require("plugins.utils")

---
--- UI
---
vim.pack.add({
    --
    -- Base for the colorscheme
    --
    { src = gh("catppuccin/nvim"), name = "catppuccin" },

    --
    -- Status line at the bottom
    --
    gh("nvim-lualine/lualine.nvim"),

    --
    -- Floating terminal (better UI/UX than the one in Snacks)
    --
    gh("akinsho/toggleterm.nvim"),

    --
    -- Popup that shows keymaps as you type
    --
    gh("folke/which-key.nvim"),

    --
    -- Change UI for cmdline + search + (?) notifications
    -- + some UNWANTED LSP changes too
    --
    gh("MunifTanjim/nui.nvim"),
    gh("folke/noice.nvim"),

    --
    -- Nice todos (inline highlighting + Snacks search)
    --
    gh("nvim-lua/plenary.nvim"),
    gh("folke/todo-comments.nvim"),
})
require("plugins.ui")

--
-- Code
--
vim.pack.add({
    --
    -- Code syntax highlight
    --
    { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },

    --
    -- Add vim operations for coding blocks (if, loop, function, class)
    --
    {
        src = gh("nvim-treesitter/nvim-treesitter-textobjects"),
        version = "main",
    },

    --
    -- Show LSP loading progress in the bottom right corner
    --
    gh("j-hui/fidget.nvim"),

    --
    -- Language Server Protocol configuration
    --
    gh("neovim/nvim-lspconfig"),

    --
    -- Automatic LSP servers installation
    --
    gh("mason-org/mason.nvim"),
    gh("mason-org/mason-lspconfig.nvim"),
    gh("WhoIsSethDaniel/mason-tool-installer.nvim"),

    --
    -- Code autocomplete
    --
    {
        src = gh("saghen/blink.cmp"),
        version = vim.version.range("1.*"),
    },

    --
    -- Snippets
    --
    { src = gh("L3MON4D3/LuaSnip"), version = vim.version.range("2.*") },

    --
    -- Code formatting
    --
    gh("stevearc/conform.nvim"),

    --
    -- Auto pairs
    --
    gh("windwp/nvim-autopairs"),

    --
    -- Auto pairs for html tags
    --
    gh("windwp/nvim-ts-autotag"),

    --
    -- Search and replace in multiple files
    --
    gh("MagicDuck/grug-far.nvim"),

    --
    -- Better quickfix list
    --
    gh("folke/trouble.nvim"),

    --
    -- Quickly toggle a block of code between a single line or multiple lines
    --
    gh("Wansmer/treesj"),

    --
    -- Debugging
    --
    gh("mfussenegger/nvim-dap"),
    gh("theHamsta/nvim-dap-virtual-text"),
    { src = gh("igorlfs/nvim-dap-view"), version = vim.version.range("1.*") },
    gh("leoluz/nvim-dap-go"),
})
require("plugins.code")

--
-- Navigation
--
vim.pack.add({
    --
    -- Recent files with frecency algorithm
    --
    gh("dzfrias/arena.nvim"),

    --
    -- Quickly go to any part of the screen
    --
    gh("folke/flash.nvim"),

    --
    -- Pin files to quickly navigate between them
    -- + better marks with previews for better navigation inside long files
    --
    gh("SergeyDarn/arrow.nvim"),

    --
    -- File manager
    --
    gh("mikavilpas/yazi.nvim"),

    --
    -- Better & faster search
    --
    gh("dmtrKovalenko/fff"),
})

require("plugins.navigation")

--
-- Other plugins
--
vim.pack.add({
    --
    -- Markdown rendering
    --
    gh("OXY2DEV/markview.nvim"),

    --
    -- Better styling to vim docs
    --
    gh("OXY2DEV/helpview.nvim"),

    --
    -- Neovim tips
    --
    gh("saxon1964/neovim-tips"),

    --
    -- Markdown outline
    --
    gh("stevearc/aerial.nvim"),
})

require("markview").setup({
    markdown = {
        headings = {
            heading_1 = {
                sign = "",
            },
            heading_2 = {
                sign = "",
            },
            heading_3 = {
                sign = "",
            },
            heading_4 = {
                sign = "",
            },
            heading_5 = {
                sign = "",
            },
            heading_6 = {
                sign = "",
            },
        },
    },
})

vim.keymap.set("n", "<leader>mt", "<cmd>Markview Toggle<cr>", { desc = "Toggle Markview" })

require("neovim_tips").setup({
    bookmark_symbol = "🔖",
})
vim.keymap.set("n", "<leader>?t", "<cmd>NeovimTips<cr>", { desc = "Tips" })
vim.keymap.set("n", "<leader>?r", "<cmd>NeovimTipsRandom<cr>", { desc = "Random Tip" })
vim.keymap.set("n", "<leader>?b", "<cmd>NeovimTipsBookmarks<cr>", { desc = "Bookmarked Tips" })

require("helpview").setup({})

require("aerial").setup({
    layout = {
        default_direction = "prefer_left",
    },
})

vim.keymap.set("n", "<leader>mo", "<cmd>AerialToggle<cr>", { desc = "Markdown Outline" })
