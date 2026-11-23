local Colorscheme = {
    THEME_CATPPUCCIN = "catppuccin",
    THEME_CUSTOM = "custom",
    currentIndex = 1,
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
    Colorscheme.THEME_CUSTOM,
    Colorscheme.THEME_CATPPUCCIN,
}

function Colorscheme:next()
    if self.currentIndex == #self.themes then
        self.currentIndex = 1
    else
        self.currentIndex = self.currentIndex + 1
    end

    self:apply()
end

function Colorscheme:current()
    return self.themes[self.currentIndex]
end

function Colorscheme:apply()
    for name, value in pairs(self:highlights()) do
        vim.api.nvim_set_hl(0, name, value)
    end
end

function Colorscheme:highlightColors()
    if self:current() == self.THEME_CATPPUCCIN then
        return {
            keyword = self.colors.PURPLE,
            string = self.colors.GREEN,
            func = self.colors.BLUE,
            parameter = self.colors.LIGHT_PINK,
            const = self.colors.PEACH,
            boolNum = self.colors.PEACH,
            module = self.colors.YELLOW,
            property = self.colors.LAVENDER,

            -- changed from default
            type = self.colors.TEAL, -- was yellow
            css = self.colors.WHITE, -- was blue
            class = self.colors.FLAMINGO, -- was yellow
        }
    end

    if self:current() == self.THEME_CUSTOM then
        return {
            keyword = self.colors.RED,
            string = self.colors.BLUE,
            func = self.colors.PURPLE,
            css = self.colors.WHITE,
            class = self.colors.FLAMINGO,

            -- The same for now as catppuccin
            module = self.colors.YELLOW,
            parameter = self.colors.LIGHT_PINK,
            const = self.colors.PEACH,
            boolNum = self.colors.PEACH,
            type = self.colors.TEAL,
            property = self.colors.LAVENDER,
        }
    end

    error("Trying to apply colorscheme that doesn't exist")
end

function Colorscheme:highlights()
    local colors = self:highlightColors()

    return {
        ["@keyword"] = { fg = colors.keyword },
        ["@keyword.coroutine"] = { fg = colors.keyword },
        ["@keyword.function"] = { fg = colors.keyword },
        ["@keyword.operator"] = { fg = colors.keyword },
        ["@keyword.import"] = { fg = colors.keyword },
        ["@keyword.export"] = { fg = colors.keyword },
        ["@keyword.type"] = { fg = colors.keyword },
        ["@keyword.modifier"] = { fg = colors.keyword },
        ["@keyword.repeat"] = { fg = colors.keyword },
        ["@keyword.return"] = { fg = colors.keyword },
        ["@keyword.debug"] = { fg = colors.keyword },
        ["@keyword.exception"] = { fg = colors.keyword },
        ["@keyword.conditional"] = { fg = colors.keyword },
        ["@include"] = { fg = colors.keyword },

        ["@string"] = { fg = colors.string },

        ["@function"] = { fg = colors.func },
        ["@function.call"] = { fg = colors.func },
        ["@function.method"] = { fg = colors.func },
        ["@function.method.call"] = { fg = colors.func },

        ["@variable.parameter"] = { fg = colors.parameter },

        ["@constant"] = { fg = colors.const },
        ["@constant.builtin"] = { fg = colors.const },

        ["@boolean"] = { fg = colors.boolNum },
        ["@number"] = { fg = colors.boolNum },
        ["@number.float"] = { fg = colors.boolNum },

        ["@type"] = { fg = colors.type },
        ["@type.definition"] = { fg = colors.type },
        ["@lsp.type.decorator"] = { fg = colors.type },

        ["@lsp.type.class"] = { fg = colors.class },

        ["@module"] = { fg = colors.module, italic = true },
        ["@namespace"] = { fg = colors.module, italic = true },
        ["@function.builtin"] = { fg = colors.module },

        ["@property"] = { fg = colors.property },
        ["@variable.member"] = { fg = colors.property },
        ["@lsp.type.enumMember"] = { fg = colors.property },

        ["@type.css"] = { fg = colors.css },
        ["@property.css"] = { fg = colors.css },
        ["@property.scss"] = { fg = colors.css },
    }
end

return Colorscheme
