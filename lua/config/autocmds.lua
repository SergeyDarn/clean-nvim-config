--
-- Set correct pwd when opening a directory (needed for Grapple)
--
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        local args = vim.fn.argv()
        for _, arg in ipairs(type(args) == "table" and args or {}) do
            if vim.fn.isdirectory(arg) == 1 then
                vim.cmd.cd(arg)
                break
            end
        end
    end,
})

--
-- After plugin install or update
-- Run appropriate build commannd for that plugin if necessary
--
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name = ev.data.spec.name
        local kind = ev.data.kind
        if kind ~= "install" and kind ~= "update" then
            return
        end

        if name == "nvim-treesitter" then
            if not ev.data.active then
                vim.cmd.packadd("nvim-treesitter")
            end
            vim.cmd("TSUpdate")
            return
        end
    end,
})

--
-- Save cursor position in a file after closing it
--
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    pattern = "*",
    command = 'silent! normal! g`"zv',
})
