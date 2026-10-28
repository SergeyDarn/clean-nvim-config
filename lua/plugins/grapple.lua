require("grapple").setup({
    win_opts = {
        width = 60,
        footer = "",
    },
})

vim.keymap.set("n", "<leader>a", function()
    local grapple = require("grapple")
    local notifier = require("snacks.notifier")

    local currentBuffer = vim.api.nvim_get_current_buf()
    local mark = grapple.exists({ buffer = currentBuffer })
    local message = "🪝 Grapple added"
    local messageType = "info"
    if mark then
        message = "⚠️ Grapple removed"
        messageType = "warn"
    end

    grapple.toggle()
    notifier.notify(message, messageType)
end, { desc = "Toggle Mark" })

vim.keymap.set("n", "<leader>h", "<cmd>Grapple toggle_tags<cr>", { desc = "Grapple" })
vim.keymap.set("n", "<S-l>", "<cmd>Grapple cycle_tags next<cr>", { desc = "Next Mark" })
vim.keymap.set("n", "<S-h>", "<cmd>Grapple cycle_tags prev<cr>", { desc = "Previous Mark" })
