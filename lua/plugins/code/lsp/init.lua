local servers = require("plugins.code.lsp.servers")

require("plugins.code.lsp.autocmds")
require("plugins.code.lsp.mason")

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
for name, server in pairs(servers) do
    vim.lsp.config(name, server)
    vim.lsp.enable(name)
end
