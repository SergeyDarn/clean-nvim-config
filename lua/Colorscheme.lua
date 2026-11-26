local Colorscheme = {
    _currentIndex = 1,
    _highlights = {},

    THEME_CATPPUCCIN = "catppuccin",
    THEME_GITHUB = "github",
    colors = {
        PEACH = "#fab387",
        RED = "#F96870",
        GREEN = "#A6E3A1",
        YELLOW = "#F9E2AF",
        BLUE = "#89B4FA",
        LAVENDER = "#B4BEFE",
        PURPLE = "#CBA6F8",
        PINK = "#f38ba8",
        LIGHT_PINK = "#EBA0AC",
        FLAMINGO = "#f2cdcd",
        TEAL = "#94e2d5",
        WHITE = "#CDD6F4",
        BLACK = "#080808",
        GREY = "#303030",
        STEEL_GREY = "#454759",
        GUNMETAL_GREY = "#2a2b3c",
    },
}

Colorscheme.colors = vim.tbl_extend("keep", Colorscheme.colors, {
    ACCENT = Colorscheme.colors.PEACH,
    BORDER = Colorscheme.colors.STEEL_GREY,
})

Colorscheme.themes = {
    Colorscheme.THEME_GITHUB,
    Colorscheme.THEME_CATPPUCCIN,
}

--
-- Apply next colorscheme
--
function Colorscheme:nextTheme()
    if self._currentIndex == #self.themes then
        self._currentIndex = 1
    else
        self._currentIndex = self._currentIndex + 1
    end

    self:compile()
end

--
-- Return curent colorscheme
--
function Colorscheme:getTheme()
    return self.themes[self._currentIndex]
end

--
-- Apply curent colorscheme
--
function Colorscheme:compile()
    self:_build()
    self:applyHighlights(self._highlights)
end

---
--- Apply highlights
---
function Colorscheme:applyHighlights(highlights)
    for name, value in pairs(highlights) do
        vim.api.nvim_set_hl(0, name, value)
    end
end

--
-- Build highlights for the current theme
--
function Colorscheme:_build()
    --
    -- NOTE: Some colors are the same as in the default Catppuccin theme
    -- It's for completeness sake
    -- I want to see all the theme colors I care about in the same place
    -- (+ Potentially in the future I would be able to stop using 3rd party theming plugins altogether)
    --
    self:_reset()

    if self:getTheme() == self.THEME_CATPPUCCIN then
        -- stylua: ignore
        self
            :_addCommonHl()
            :_addKeywordHl(self.colors.PURPLE)
            :_addStringHl(self.colors.GREEN)
            :_addFunctionHl(self.colors.BLUE)

        return
    end

    if self:getTheme() == self.THEME_GITHUB then
        -- stylua: ignore
        self
            :_addCommonHl()
            :_addKeywordHl(self.colors.RED)
            :_addStringHl(self.colors.BLUE)
            :_addFunctionHl(self.colors.PURPLE)

        return
    end

    error("Trying to apply colorscheme that doesn't exist")
end

--
-- Add highlights that are common between themes
--
function Colorscheme:_addCommonHl()
    -- stylua: ignore
    return self
        :_addParamHl(self.colors.LIGHT_PINK)
        :_addConstHl(self.colors.PEACH)
        :_addSimpleTypeHl(self.colors.PEACH)
        :_addTypeHl(self.colors.YELLOW)
        :_addClassHl(self.colors.FLAMINGO)
        :_addModuleHl(self.colors.PEACH)
        :_addPropertyHl(self.colors.LAVENDER)
        :_addCssHl(self.colors.WHITE)
end

function Colorscheme:_reset()
    self._highlights = {}
end

---
--- @param highlights string[] | vim.api.keyset.highlight[]
---
function Colorscheme:_addHighlights(highlights)
    self._highlights = vim.tbl_extend("keep", self._highlights, highlights)
    return self
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:_buildHl(highlight)
    if type(highlight) == "string" then
        return { fg = highlight }
    end

    return highlight
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:_addKeywordHl(highlight)
    highlight = self:_buildHl(highlight)

    return self:_addHighlights({
        ["@keyword"] = highlight,
        ["@keyword.coroutine"] = highlight,
        ["@keyword.function"] = highlight,
        ["@keyword.operator"] = highlight,
        ["@keyword.import"] = highlight,
        ["@keyword.export"] = highlight,
        ["@keyword.type"] = highlight,
        ["@keyword.modifier"] = highlight,
        ["@keyword.repeat"] = highlight,
        ["@keyword.return"] = highlight,
        ["@keyword.debug"] = highlight,
        ["@keyword.exception"] = highlight,
        ["@keyword.conditional"] = highlight,
        ["@include"] = highlight,

        ["BlinkCmpKindKeyword"] = highlight,
    })
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:_addStringHl(highlight)
    highlight = self:_buildHl(highlight)

    return self:_addHighlights({
        ["@string"] = highlight,
    })
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:_addFunctionHl(highlight)
    highlight = self:_buildHl(highlight)

    return self:_addHighlights({
        ["@function"] = highlight,
        ["@function.call"] = highlight,
        ["@function.method"] = highlight,
        ["@function.method.call"] = highlight,

        BlinkCmpKindFunction = highlight,
        BlinkCmpKindMethod = highlight,
    })
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:_addParamHl(highlight)
    highlight = self:_buildHl(highlight)

    return self:_addHighlights({
        ["@variable.parameter"] = highlight,
    })
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:_addConstHl(highlight)
    highlight = self:_buildHl(highlight)

    return self:_addHighlights({
        ["@constant"] = highlight,
        ["@constant.builtin"] = highlight,

        BlinkCmpKindConstant = highlight,
    })
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:_addSimpleTypeHl(highlight)
    highlight = self:_buildHl(highlight)

    return self:_addHighlights({
        ["@boolean"] = highlight,
        ["@number"] = highlight,
        ["@number.float"] = highlight,

        BlinkCmpKindValue = highlight,
    })
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:_addTypeHl(highlight)
    highlight = self:_buildHl(highlight)

    return self:_addHighlights({
        ["@type"] = highlight,
        ["@type.definition"] = highlight,
        ["@type.builtin"] = highlight,
        ["@lsp.type.decorator"] = highlight,
        ["@lsp.type.enumMember"] = highlight,

        BlinkCmpKindInterface = highlight,
        BlinkCmpKindStruct = highlight,
        BlinkCmpKindEnum = highlight,
        BlinkCmpKindEnumMember = highlight,
    })
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:_addClassHl(highlight)
    highlight = self:_buildHl(highlight)

    return self:_addHighlights({
        ["@lsp.type.class"] = highlight,

        BlinkCmpKindClass = highlight,
    })
end

---
--- @param color string
---
function Colorscheme:_addModuleHl(color)
    return self:_addHighlights({
        ["@module"] = { fg = color, italic = true },
        ["@namespace"] = { fg = color, italic = true },
        ["@function.builtin"] = { fg = color },
        ["@constant.macro"] = { fg = color },

        BlinkCmpKindModule = { fg = color },
        BlinkCmpKindModules = { fg = color },
    })
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:_addPropertyHl(highlight)
    highlight = self:_buildHl(highlight)

    return self:_addHighlights({
        ["@property"] = highlight,
        ["@variable.member"] = highlight,

        BlinkCmpKindVariable = highlight,
        BlinkCmpKindField = highlight,
        BlinkCmpKindProperty = highlight,
    })
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:_addCssHl(highlight)
    highlight = self:_buildHl(highlight)

    return self:_addHighlights({
        ["@type.css"] = highlight,
        ["@property.css"] = highlight,
        ["@property.scss"] = highlight,
    })
end

return Colorscheme
