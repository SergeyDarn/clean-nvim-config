-- Automatically install LSPs and related tools to stdpath for Neovim
require("mason").setup({})

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
