require("nvim-treesitter-textobjects").setup({})

local select = require("nvim-treesitter-textobjects.select")

---
--- IF
---
vim.keymap.set({ "x", "o" }, "ai", function()
    select.select_textobject("@conditional.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "ii", function()
    select.select_textobject("@conditional.inner", "textobjects")
end)

---
--- Loop
---
vim.keymap.set({ "x", "o" }, "al", function()
    select.select_textobject("@loop.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "il", function()
    select.select_textobject("@loop.inner", "textobjects")
end)

---
--- Function
---
vim.keymap.set({ "x", "o" }, "af", function()
    select.select_textobject("@function.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "if", function()
    select.select_textobject("@function.inner", "textobjects")
end)

---
--- Class
---
vim.keymap.set({ "x", "o" }, "ac", function()
    select.select_textobject("@class.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "ic", function()
    select.select_textobject("@class.inner", "textobjects")
end)

---
--- Block
---
vim.keymap.set({ "x", "o" }, "ab", function()
    select.select_textobject("@block.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "ib", function()
    select.select_textobject("@block.inner", "textobjects")
end)
