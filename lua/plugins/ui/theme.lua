local catppuccin = require("catppuccin")

local isTransparentByDefault = true
local textAccentColor = "#fab387"
local borderColor = "#454759"
local transparentHighlightColor = borderColor
local normalHighlightColor = "#2a2b3c"

local function getHighlightColor(isTransprentTheme)
    if isTransprentTheme then
        return transparentHighlightColor
    end

    return normalHighlightColor
end

catppuccin.setup({
    flavour = "mocha",
    auto_integrations = true,
    transparent_background = isTransparentByDefault,
    float = {
        solid = true,
        transparent = isTransparentByDefault,
    },
    custom_highlights = function(colors)
        local utils = require("catppuccin.utils.colors")

        return {
            FloatBorder = { fg = borderColor, bg = "none" },
            SnacksPickerMatch = { fg = textAccentColor, bg = "none" },
            LineNr = { fg = utils.darken(colors.lavender, 0.7) },

            BlinkCmpMenuBorder = { fg = borderColor },
            BlinkCmpLabel = { fg = colors.text },
            BlinkCmpLabelMatch = { fg = textAccentColor },
        }
    end,
})

--
-- Calling 'compile' is needed even on opening vim
-- for consistent theme behavior after switching them
-- (catppuccin persists the changed settings even after restart for some reason)
--
local function setTheme(isTransparent)
    catppuccin.compile()
    vim.cmd.colorscheme("catppuccin-nvim")

    vim.o.cursorline = not isTransparent
    vim.g.themeCursorLine = not isTransparent
    vim.api.nvim_set_hl(0, "CursorLine", { bg = getHighlightColor(isTransparent) })
end

setTheme(isTransparentByDefault)

vim.keymap.set("n", "<leader>vt", function()
    local isTransparentNow = catppuccin.options.float.transparent
    catppuccin.options.transparent_background = not isTransparentNow
    catppuccin.options.float.transparent = not isTransparentNow

    setTheme(not isTransparentNow)
end, { desc = "Toggle Transparency" })
