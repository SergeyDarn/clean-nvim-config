--
-- Set correct current working directory when opening vim
--
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        local args = vim.fn.argv()
        for _, arg in ipairs(type(args) == "table" and args or {}) do
            if vim.fn.isdirectory(arg) == 1 then
                vim.cmd.chdir(arg)
                break
            end
        end
    end,
})

--
-- Set correct current working directory when jumping between projects
-- (works by watching cursor jump list)
--
local set_root = require("config.utils.set_root")
local jump_group = vim.api.nvim_create_augroup("JumpAutocmd", { clear = true })
local last_jump_idx = -1

vim.api.nvim_create_autocmd("CursorMoved", {
    group = jump_group,
    callback = function()
        local jumplist, current_idx = unpack(vim.fn.getjumplist())

        -- If our position index inside the jump list shifts, a jump event occurred
        if current_idx ~= last_jump_idx then
            last_jump_idx = current_idx

            set_root()
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
