require("catppuccin").setup({
    flavour = "mocha",
    auto_integrations = true,
})
vim.cmd.colorscheme("catppuccin-nvim")

local textAccentColor = "#fab387"
local borderColor = "#9ca0b0"

-- Change popup windows border and title colors
vim.api.nvim_set_hl(0, "FloatBorder", { fg = borderColor, bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatTitle", { fg = textAccentColor, bg = "NONE" })

-- Change picker's searched/selected text color
vim.api.nvim_set_hl(0, "SnacksPickerMatch", { fg = textAccentColor, bg = "NONE" })
