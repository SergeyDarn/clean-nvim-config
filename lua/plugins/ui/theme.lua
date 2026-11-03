local catppuccin = require("catppuccin")

local is_transparent_by_default = true
local textAccentColor = "#fab387"
local borderColor = "#454759"

catppuccin.setup({
    flavour = "mocha",
    auto_integrations = true,
    transparent_background = is_transparent_by_default,
    float = {
        solid = true,
        transparent = is_transparent_by_default,
    },
    custom_highlights = function(colors)
        local utils = require("catppuccin.utils.colors")

        return {
            FloatBorder = { fg = borderColor, bg = "none" },
            SnacksPickerMatch = { fg = textAccentColor, bg = "none" },
            LineNr = { fg = utils.darken(colors.lavender, 0.7) },
        }
    end,
})

--
-- Calling 'compile' is needed even on opening vim
-- for consistent theme behavior after switching them
-- (catppuccin persists the changed settings even after restart for some reason)
--
local function setTheme(cursorLine)
    catppuccin.compile()
    vim.cmd.colorscheme("catppuccin-nvim")

    vim.o.cursorline = cursorLine
    vim.g.themeCursorLine = cursorLine
end

setTheme(not is_transparent_by_default)

vim.keymap.set("n", "<leader>vt", function()
    catppuccin.options.transparent_background = not catppuccin.options.transparent_background
    catppuccin.options.float.transparent = not catppuccin.options.float.transparent

    setTheme(not vim.o.cursorline)
end, { desc = "Toggle Transparency" })
