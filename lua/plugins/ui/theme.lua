local catppuccin = require("catppuccin")
local Colorscheme = require("Colorscheme")

local isTransparentByDefault = true

local function getHighlightColor(isTransprentTheme)
    if isTransprentTheme then
        return Colorscheme.colors.STEEL_GREY
    end

    return Colorscheme.colors.GUNMETAL_GREY
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
            FloatBorder = { fg = Colorscheme.colors.BORDER, bg = "none" },
            LineNr = { fg = utils.darken(colors.lavender, 0.7) },

            IncSearch = { bg = Colorscheme.colors.ACCENT, fg = Colorscheme.colors.BLACK },

            SnacksPickerMatch = { bg = Colorscheme.colors.ACCENT, fg = Colorscheme.colors.BLACK },
            SnacksPickerSearch = { bg = Colorscheme.colors.ACCENT, fg = Colorscheme.colors.BLACK },
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
    Colorscheme:compile()
end

setTheme(isTransparentByDefault)

vim.keymap.set("n", "<leader>vt", function()
    local isTransparentNow = catppuccin.options.float.transparent
    catppuccin.options.transparent_background = not isTransparentNow
    catppuccin.options.float.transparent = not isTransparentNow

    setTheme(not isTransparentNow)
end, { desc = "Toggle Transparency" })

vim.keymap.set("n", "<leader>vc", function()
    Colorscheme:nextTheme()
end, { desc = "Next colorscheme" })
