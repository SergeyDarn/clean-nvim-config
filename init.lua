--
-- Enable faster startup by caching compiled Lua modules
--
vim.loader.enable()

local function gh(repo)
    return "https://github.com/" .. repo
end

--
-- General configs
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
})
require("plugins.chainsaw")

--
-- Snacks
-- (Init snacks first because some other plugins might be dependant on them)
--
vim.pack.add({ gh("folke/snacks.nvim") })
require("plugins.snacks")

--
-- Utils
--
vim.pack.add({
    --
    -- Icons
    --
    gh("nvim-mini/mini.icons"),

    --
    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    gh("nvim-mini/mini.surround"),
    -- "q" for quote, "b" for block, "t" for tag
    gh("nvim-mini/mini.ai"),

    --
    -- Automatic indentation style detection for the file
    --
    gh("NMAC427/guess-indent.nvim"),

    --
    -- Change relative line numbers to only include 1-5 numbers, for vim motions comfort
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
})
require("plugins.utils")

---
--- UI
---
vim.pack.add({
    --
    -- Theme
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
    -- Navigation between files
    --
    gh("cbochs/grapple.nvim"),

    --
    -- Code autocomplete
    --
    {
        src = gh("saghen/blink.cmp"),
        version = vim.version.range("1.*"),
    },

    --
    -- Code formatting
    --
    gh("stevearc/conform.nvim"),

    --
    -- Auto pairs
    --
    -- TODO: check default config
    -- and see if there might be better options for me
    gh("windwp/nvim-autopairs"),

    --
    -- Auto pairs for html tags
    --
    gh("windwp/nvim-ts-autotag"),

    --
    -- Search and replace in multiple files
    --
    gh("MagicDuck/grug-far.nvim"),
})
require("plugins.code")

--
-- TODO: install important plugins
--
-- marks.nvim (figure out if I need it)
-- nvim-treesitter-textobjects (figure out if I need it)

--
-- NOTE: try plugins
--
-- blink-cmp-yanky
-- lua snippets (config from kickstart.nvim)
-- vim-dadbod for working with databases
-- nvim-dap-go for debugging
-- tabout
-- twilight (snacks dim) for focus on the code block I'm typing in
-- Find plugin for file local history (like in phpstorm)
-- flash.nvim for quick search and jump
--
