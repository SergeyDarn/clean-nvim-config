-- Set space as the leader key (must happen before loading plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Tabulation config
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
-- Do not show tabs/spaces visually
vim.opt.list = false

-- Show relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enabled 24-bit RGB color in the TUI
vim.o.termguicolors = true

-- Case-insensitive searching
-- UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Disable long lines wrapping
vim.o.wrap = false

-- Enable undo/redo changes even after closing and reopening a file
vim.o.undofile = true

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
-- (amazingly improves experience of scrolling the file)
vim.o.scrolloff = 10

-- New horizontal splits go below
vim.opt.splitbelow = true

-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
-- See `:help 'clipboard'`
vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)
