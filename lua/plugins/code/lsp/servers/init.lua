-- LSP Enabled servers
-- See `:help lsp-config` for information about keys and how to configure
---@type table<string, vim.lsp.Config>
return {
    -- Used to format Lua code
    stylua = {},

    lua_ls = require("plugins.code.lsp.servers.lua_ls"),
    gopls = require("plugins.code.lsp.servers.gopls"),
    goimports = {},
    gofumpt = {},

    -- TODO:
    -- add svelte too
    cssls = {},
    emmet_ls = {},
    emmet_language_server = {},
    ts_ls = {
        root_markers = { "package.json" },
        filetypes = { "typescript", "javascript", "vue" },
        init_options = {
            plugins = {
                {
                    name = "@vue/typescript-plugin",
                    location = require("mason-registry").get_package("vue-language-server"):get_install_path()
                        .. "/node_modules/@vue/language-server",
                    languages = { "vue" },
                    confignamespace = "typescript",
                },
            },
        },
    },
    vue_ls = {},
}
