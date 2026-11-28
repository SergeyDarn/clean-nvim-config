local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.setup({})

local function strFromArgs(args)
    if args == nil or args[1] == nil or args[1][1] == nil then
        return ""
    end

    return args[1][1]
end

local function firstCharLower(args)
    local str = strFromArgs(args)
    if str == "" then
        return ""
    end

    return str:sub(1, 1):lower()
end

local function firstCharLowerStr(args)
    local str = strFromArgs(args)
    if str == "" then
        return ""
    end

    return firstCharLower(args) .. str:sub(2)
end

-- stylua: ignore
ls.add_snippets("go", {
    -- Enum
    ls.snippet(
        "enum",
        fmt(
[[

type {1} int

const (
    {2} {} = iota
)

var {lower}Map = map[{}]string{{
    {}: "",
}}

func ({firstChar} {}) String() string {{
    return {lower2}Map[{firstChar2}]
}}
]],
            {
                ls.insert_node(1),
                ls.insert_node(2), rep(1),
                lower = ls.function_node(firstCharLowerStr, { 1 }), rep(1),
                rep(2),
                firstChar = ls.function_node(firstCharLower, { 1 }), rep(1),
                lower2 = ls.function_node(firstCharLowerStr, { 1 }), firstChar2 = ls.function_node(firstCharLower, { 1 })
            },
            {
                trim_empty = false
            }
        ),
        {
            key = "enum",
        }
    ),
})
