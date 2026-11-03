-- Automatically install LSPs and related tools to stdpath for Neovim
require("mason").setup({
    ui = {
        border = vim.g.border_type,
        cursorline = false,
    },
})

--
-- Disable cursorline inside mason for transparent theme
-- (it's autocmd because mason doesn't provide an easier way to configure this)
--

vim.api.nvim_create_autocmd("FileType", {
    pattern = "mason",
    callback = function()
        if not vim.g.themeCursorLine then
            vim.opt_local.cursorline = false
        end
    end,
})

-- Translates between nvim-lspconfig server names
-- and mason.nvim package names (e.g. lua_ls <-> lua-language-server)
require("mason-lspconfig").setup({
    automatic_enable = false,
})

-- Ensure the servers and tools above are installed
--
-- To check the current status of installed tools and/or manually install
-- other tools, you can run
-- :Mason
--
local servers = require("plugins.code.lsp.servers")
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {})

require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
