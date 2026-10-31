local arena = require("arena")

local exec = function(win, cmd)
    local current = win:current()
    win:close()
    local info = vim.fn.getbufinfo(current.bufnr)[1]

    vim.cmd(cmd .. vim.fn.bufname(current.bufnr))
    vim.fn.cursor(info.lnum, 0)
end

arena.setup({
    always_context = {
        "go.mod",
        "main.go",
        "package.json",
        "init.lua",
        "config.toml",
        "README.md",
    },
    buf_options = {},
    keybinds = {
        ["v"] = function(win)
            exec(win, "botright vsplit ")
        end,
    },
})

vim.keymap.set("n", "<leader>a", function()
    arena.toggle()
end, { desc = "Arena" })
