--
-- LSP
--
vim.keymap.set("n", "<leader>cl", function()
    Snacks.picker.lsp_config({
        layout = "telescope",
    })
end, { desc = "LSP: Info" })

vim.keymap.set("n", "gd", function()
    Snacks.picker.lsp_definitions()
end, { desc = "LSP: Go to Definition" })

vim.keymap.set("n", "go", "<C-t>", { desc = "LSP: Go Out of Definition" })

vim.keymap.set("n", "gr", function()
    Snacks.picker.lsp_references()
end, { desc = "LSP: References" })

vim.keymap.set("n", "gI", function()
    Snacks.picker.lsp_implementations()
end, { desc = "LSP: Implementations" })

vim.keymap.set("n", "<leader>ss", function()
    Snacks.picker.lsp_symbols()
end, { desc = "LSP: Symbols" })

vim.keymap.set("n", "<leader>sw", function()
    Snacks.picker.lsp_workspace_symbols()
end, { desc = "LSP: Workspace Symbols" })
