local catppuccin = require("catppuccin")
local Colorscheme = require("plugins.ui.Colorscheme")

local COLOR_ACCENT = Colorscheme.colors.PEACH
local COLOR_BORDER = "#454759"
local COLOR_TRANSPARENT_HIGHLIGHT = COLOR_BORDER
local COLOR_NORMAL_HIGHLIGHT = "#2a2b3c"

local isTransparentByDefault = true

local function getHighlightColor(isTransprentTheme)
    if isTransprentTheme then
        return COLOR_TRANSPARENT_HIGHLIGHT
    end

    return COLOR_NORMAL_HIGHLIGHT
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
            FloatBorder = { fg = COLOR_BORDER, bg = "none" },
            SnacksPickerMatch = { fg = COLOR_ACCENT, bg = "none" },
            LineNr = { fg = utils.darken(colors.lavender, 0.7) },

            BlinkCmpMenuBorder = { fg = COLOR_BORDER },
            BlinkCmpLabel = { fg = colors.text },
            BlinkCmpLabelMatch = { fg = COLOR_ACCENT },

            NoiceCmdlinePopupBorder = { fg = COLOR_ACCENT },
            NoiceCmdlineIcon = { fg = COLOR_ACCENT },
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
    Colorscheme:apply()
end

setTheme(isTransparentByDefault)

vim.keymap.set("n", "<leader>vt", function()
    local isTransparentNow = catppuccin.options.float.transparent
    catppuccin.options.transparent_background = not isTransparentNow
    catppuccin.options.float.transparent = not isTransparentNow

    setTheme(not isTransparentNow)
end, { desc = "Toggle Transparency" })

vim.keymap.set("n", "<leader>vc", function()
    Colorscheme:next()
end, { desc = "Next colorscheme" })
