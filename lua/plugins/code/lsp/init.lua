--
-- ! Important. We need to load mason before requiring lsp servers,
-- otherwise there's an error
--
require("plugins.code.lsp.mason")
require("plugins.code.lsp.autocmds")

--
-- Progress bar
--
require("fidget").setup({})

--
-- Show errors and warnings inline
--
vim.diagnostic.config({
    underline = false,
    virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
    },
})

--
-- Enable LSP servers
--
local servers = require("plugins.code.lsp.servers")
for name, server in pairs(servers) do
    vim.lsp.config(name, server)
    vim.lsp.enable(name)
end
