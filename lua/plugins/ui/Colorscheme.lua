local Colorscheme = {
    THEME_CATPPUCCIN = "catppuccin",
    THEME_GITHUB = "github",
    currentIndex = 1,
    highlights = {},
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
    },
}

Colorscheme.themes = {
    Colorscheme.THEME_GITHUB,
    Colorscheme.THEME_CATPPUCCIN,
}

--
-- Apply next colorscheme
--
function Colorscheme:next()
    if self.currentIndex == #self.themes then
        self.currentIndex = 1
    else
        self.currentIndex = self.currentIndex + 1
    end

    self:apply()
end

--
-- Return curent colorscheme
--
function Colorscheme:getCurrent()
    return self.themes[self.currentIndex]
end

--
-- Apply curent colorscheme
--
function Colorscheme:apply()
    self:buildHighlights()
    self:applyHighlights()
end

---
--- Apply highlights
---
function Colorscheme:applyHighlights()
    for name, value in pairs(self.highlights) do
        vim.api.nvim_set_hl(0, name, value)
    end
end

--
-- Build highlights for the current theme
--
function Colorscheme:buildHighlights()
    --
    -- NOTE: Some colors are the same as in the default Catppuccin theme
    -- It's for completeness sake
    -- I want to see all the theme colors I care about in the same place
    -- (+ Potentially in the future I would be able to stop using 3rd party theming plugins altogether)
    --
    self:resetHighlights()

    if self:getCurrent() == self.THEME_CATPPUCCIN then
        -- stylua: ignore
        self
            :addCommonHl()
            :addKeywordHl(self.colors.PURPLE)
            :addStringHl(self.colors.GREEN)
            :addFunctionHl(self.colors.BLUE)

        return
    end

    if self:getCurrent() == self.THEME_GITHUB then
        -- stylua: ignore
        self
            :addCommonHl()
            :addKeywordHl(self.colors.RED)
            :addStringHl(self.colors.BLUE)
            :addFunctionHl(self.colors.PURPLE)

        return
    end

    error("Trying to apply colorscheme that doesn't exist")
end

--
-- Add highlights that are common between themes
--
function Colorscheme:addCommonHl()
    -- stylua: ignore
    return self
        :addParamHl(self.colors.LIGHT_PINK)
        :addConstHl(self.colors.PEACH)
        :addSimpleTypeHl(self.colors.PEACH)
        :addTypeHl(self.colors.TEAL)
        :addClassHl(self.colors.FLAMINGO)
        :addModuleHl(self.colors.YELLOW)
        :addPropertyHl(self.colors.LAVENDER)
        :addCssHl(self.colors.WHITE)
end

function Colorscheme:resetHighlights()
    self.highlights = {}
end

---
--- @param highlights string[] | vim.api.keyset.highlight[]
---
function Colorscheme:addHighlights(highlights)
    self.highlights = vim.tbl_extend("keep", self.highlights, highlights)
    return self
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:buildHighlight(highlight)
    if type(highlight) == "string" then
        return { fg = highlight }
    end

    return highlight
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:addKeywordHl(highlight)
    highlight = self:buildHighlight(highlight)

    return self:addHighlights({
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
    })
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:addStringHl(highlight)
    highlight = self:buildHighlight(highlight)

    return self:addHighlights({
        ["@string"] = highlight,
    })
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:addFunctionHl(highlight)
    highlight = self:buildHighlight(highlight)

    return self:addHighlights({
        ["@function"] = highlight,
        ["@function.call"] = highlight,
        ["@function.method"] = highlight,
        ["@function.method.call"] = highlight,
    })
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:addParamHl(highlight)
    highlight = self:buildHighlight(highlight)

    return self:addHighlights({
        ["@variable.parameter"] = highlight,
    })
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:addConstHl(highlight)
    highlight = self:buildHighlight(highlight)

    return self:addHighlights({
        ["@constant"] = highlight,
        ["@constant.builtin"] = highlight,
    })
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:addSimpleTypeHl(highlight)
    highlight = self:buildHighlight(highlight)

    return self:addHighlights({
        ["@boolean"] = highlight,
        ["@number"] = highlight,
        ["@number.float"] = highlight,
    })
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:addTypeHl(highlight)
    highlight = self:buildHighlight(highlight)

    return self:addHighlights({
        ["@type"] = highlight,
        ["@type.definition"] = highlight,
        ["@lsp.type.decorator"] = highlight,
    })
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:addClassHl(highlight)
    highlight = self:buildHighlight(highlight)

    return self:addHighlights({
        ["@lsp.type.class"] = highlight,
    })
end

---
--- @param color string
---
function Colorscheme:addModuleHl(color)
    return self:addHighlights({
        ["@module"] = { fg = color, italic = true },
        ["@namespace"] = { fg = color, italic = true },
        ["@function.builtin"] = { fg = color },
    })
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:addPropertyHl(highlight)
    highlight = self:buildHighlight(highlight)

    return self:addHighlights({
        ["@property"] = highlight,
        ["@variable.member"] = highlight,
        ["@lsp.type.enumMember"] = highlight,
    })
end

---
--- @param highlight string | vim.api.keyset.highlight
---
function Colorscheme:addCssHl(highlight)
    highlight = self:buildHighlight(highlight)

    return self:addHighlights({
        ["@type.css"] = highlight,
        ["@property.css"] = highlight,
        ["@property.scss"] = highlight,
    })
end

return Colorscheme
