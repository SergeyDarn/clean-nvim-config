local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.setup({})

local function firstChar(args)
    local str = args[1][1]
    return str:sub(1, 1)
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

var {}Map = map[{}]string{{
    {}: "",
}}

func ({m} {}) String() string {{
    return {}Map[{mm}]
}}
]],
            {
                ls.insert_node(1),
                ls.insert_node(2), rep(1),
                rep(1), rep(1),
                rep(2),
                m = ls.function_node(firstChar, { 1 }), rep(1),
                rep(1), mm = ls.function_node(firstChar, { 1 })
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
