require("plugins.code.lsp")
require("plugins.code.treesitter")

require("plugins.code.blink")
require("plugins.code.conform")

require("nvim-autopairs").setup({})
require("nvim-ts-autotag").setup({})

require("plugins.code.grug_far")
require("plugins.code.trouble")

local treesj = require("treesj")
treesj.setup({
    use_default_keymaps = false,
})

vim.keymap.set("n", "<leader>ct", treesj.toggle, { desc = "Toggle code: oneline / multiline" })
