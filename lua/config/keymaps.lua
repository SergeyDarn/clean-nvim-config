--
-- Clear highlights on search when pressing <Esc> in normal mode
--
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

--
-- Switch between windows
--
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })

--
-- Quit all
--
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

--
-- Add vertical split
--
vim.keymap.set("n", "<leader>w", "<cmd>botright vsplit<cr>", { desc = "Vertical Split" })

--
-- Custom movement commands
--
vim.keymap.set({ "n", "o", "x" }, "e", "$", { desc = "Go to end of the line" })
vim.keymap.set({ "n", "o", "x" }, "0", "^", { desc = "Go to start of the line" })

--
-- Move highlighed text
--
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted text down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted text up" })

vim.keymap.set("n", "J", "}", { desc = "Scroll down fast" })
vim.keymap.set("n", "K", "{", { desc = "Scroll up fast" })

--
-- Plugins and Vim
--
vim.keymap.set("n", "<leader>vr", "<cmd>write | restart<CR>", { desc = "Restart Neovim" })
vim.keymap.set("n", "<leader>vu", vim.pack.update, { desc = "Update VimPack Plugins" })

--
-- Toggle Markdown Todo
--

local emptyTodoPattern = "%[ %]"
local completedTodoPattern = "%[x%]"
local newTodoPattern = "^%s*(-?%s*)"

vim.keymap.set("n", "<leader>x", function()
    local line = vim.api.nvim_get_current_line()
    local new_line

    if line:find(emptyTodoPattern) then
        new_line = line:gsub(emptyTodoPattern, "[x]", 1)
    elseif line:find(completedTodoPattern) then
        new_line = line:gsub(completedTodoPattern, "[ ]", 1)
    else
        -- Add checkbox if line doesn't have one
        new_line = line:gsub(newTodoPattern, "%1- [ ] ", 1)
    end

    vim.api.nvim_set_current_line(new_line)
end, { desc = "Toggle Markdown todo checkbox" })
