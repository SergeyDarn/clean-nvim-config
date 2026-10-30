--
-- LSP
--
vim.keymap.set("n", "<leader>cl", function()
    Snacks.picker.lsp_config()
end, { desc = "LSP: Info" })

vim.keymap.set("n", "gd", function()
    Snacks.picker.lsp_definitions()
end, { desc = "LSP: Go to Definition" })

vim.keymap.set("n", "gr", function()
    Snacks.picker.lsp_references()
end, { desc = "LSP: References" })
