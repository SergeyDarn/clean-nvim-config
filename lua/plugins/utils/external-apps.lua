local open_fullscreen_app = function(cmd)
    Snacks.terminal({ cmd }, {
        win = {
            width = 0,
            height = 0,
            keys = {
                gf = "",
            },
        },
    })
end

vim.keymap.set("n", "<leader>jj", function()
    open_fullscreen_app("jjui")
end, { desc = "Open jj" })

vim.keymap.set("n", "<leader>gm", function()
    open_fullscreen_app("ec")
end, { desc = "Open Merge Conflict Resolver" })

vim.keymap.set("n", "<leader>mm", function()
    open_fullscreen_app("rmpc")
end, { desc = "Open Music Player" })

vim.keymap.set("n", "<leader>pp", function()
    open_fullscreen_app("posting")
end, { desc = "Open posting" })

vim.keymap.set("n", "<leader>db", function()
    open_fullscreen_app("sqlit")
end, { desc = "Open sqlit" })
