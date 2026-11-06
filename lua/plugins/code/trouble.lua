-- TODO: fix syntax highlighting
local trouble = require("trouble")

trouble.setup({
    modes = {
        symbols = {
            win = { position = "left" },
        },
    },
})

vim.keymap.set("n", "<leader>td", "<cmd>Trouble todo toggle<CR>", { desc = "Trouble Todo" })
vim.keymap.set("n", "<leader>tr", "<cmd>Trouble lsp_references toggle<CR>", { desc = "Trouble Lsp References" })
vim.keymap.set("n", "<leader>te", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Trouble Lsp Diagnostics" })
vim.keymap.set("n", "<leader>ts", "<cmd>Trouble symbols toggle<CR>", { desc = "Trouble Lsp Symbols" })

vim.keymap.set("n", "<leader>tq", function()
    trouble.close()
end, { desc = "Close trouble" })

vim.keymap.set("n", "<leader>tj", function()
    trouble.next({ jump = true })
end, { desc = "Trouble next" })

vim.keymap.set("n", "<leader>tk", function()
    trouble.prev({ jump = true })
end, { desc = "Trouble prev" })

vim.keymap.set("n", "<leader>tp", function()
    trouble.prev({ jump = true })
end, { desc = "Trouble prev" })

--
-- Automatically open trouble for quicklist
--
vim.api.nvim_create_autocmd("BufRead", {
    callback = function(ev)
        if vim.bo[ev.buf].buftype == "quickfix" then
            vim.schedule(function()
                vim.cmd("cclose") -- Close the standard quickfix window
                vim.cmd("Trouble qflist open") -- Open it in Trouble instead
            end)
        end
    end,
})
