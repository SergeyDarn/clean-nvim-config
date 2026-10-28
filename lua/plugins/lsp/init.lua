local servers = require("plugins.lsp.servers")

require("plugins.lsp.autocmds")

-- Progress bar
require("fidget").setup({})

-- Automatically install LSPs and related tools to stdpath for Neovim
require("mason").setup({})

-- Translates between nvim-lspconfig server names and mason.nvim package names (e.g. lua_ls <-> lua-language-server)
require("mason-lspconfig").setup({
    automatic_enable = false, -- Change this to true if you want to automatically enable servers that are installed manually (e.g. via :Mason / :MasonInstall)
})

-- Ensure the servers and tools above are installed
--
-- To check the current status of installed tools and/or manually install
-- other tools, you can run
-- :Mason
--
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {})

require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

vim.diagnostic.config({
    underline = false,
    virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
    },
})

for name, server in pairs(servers) do
    vim.lsp.config(name, server)
    vim.lsp.enable(name)
end
