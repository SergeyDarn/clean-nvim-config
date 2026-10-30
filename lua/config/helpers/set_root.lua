--- Taken from mini/misc lib and slightly simplified
--- https://github.com/nvim-mini/mini.misc/blob/main/lua/mini/misc.lua
---
--- Find root directory
---
--- Based on a buffer name (full path to file opened in a buffer) find a root
--- directory. If buffer is not associated with file, returns `nil`.
---
--- Root directory is a directory containing at least one of pre-defined files.
--- It is searched using |vim.fs.find()| with `upward = true` starting from
--- directory of current buffer file until first occurrence of root file(s).
---
--- Notes:
--- - Uses directory path caching to speed up computations. This means that no
---   changes in root directory will be detected after directory path was already
---   used in this function. Reload Neovim to account for that.
---

local root_cache = {}

local find_root = function()
    local current_buf = vim.api.nvim_get_current_buf() or 0
    local root_markers = { ".git", "go.mod", "config.toml", "package.json", "Makefile" }

    -- Compute directory to start search from. NOTEs on why not using file path:
    -- - This has better performance because `vim.fs.find()` is called less.
    -- - *Needs* to be a directory for callable `names` to work.
    -- - Later search is done including initial `path` if directory, so this
    --   should work for detecting buffer directory as root.
    local path = vim.api.nvim_buf_get_name(current_buf)
    if path == "" then
        return
    end
    local dir_path = vim.fs.dirname(path)

    local res = root_cache[dir_path]
    if res ~= nil then
        return res
    end

    local root_file = vim.fs.find(root_markers, { path = dir_path, upward = true })[1]
    if root_file ~= nil then
        res = vim.fs.dirname(root_file)
    end

    -- Use absolute path to an existing directory
    if type(res) ~= "string" then
        return
    end

    res = vim.fs.normalize(vim.fn.fnamemodify(res, ":p"))
    if vim.fn.isdirectory(res) == 0 then
        return
    end

    root_cache[dir_path] = res

    return res
end

--
-- Set root directory
--
local set_root = function()
    local cwd = vim.fn.getcwd()
    local root = find_root()

    if root == nil or root == cwd then
        return
    end

    vim.fn.chdir(root)
end

return set_root
