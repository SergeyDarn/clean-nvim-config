-- LSP Enabled servers
-- See `:help lsp-config` for information about keys and how to configure
---@type table<string, vim.lsp.Config>
return {
    stylua = {}, -- Used to format Lua code

    -- Special Lua Config, as recommended by neovim help docs
    -- TODO: fix lua warnings
    lua_ls = {
        on_init = function(client)
            -- Disable formatting (formatting is done by stylua)
            client.server_capabilities.documentFormattingProvider = false

            if client.workspace_folders then
                local path = client.workspace_folders[1].name
                if
                    path ~= vim.fn.stdpath("config")
                    and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
                then
                    return
                end
            end

            --[[@as lspconfig.settings.lua_ls]]
            local current_settings = client.config.settings
            client.config.settings.Lua = vim.tbl_deep_extend("force", current_settings.Lua, {
                runtime = {
                    version = "LuaJIT",
                    path = { "lua/?.lua", "lua/?/init.lua" },
                },
                workspace = {
                    checkThirdParty = false,
                    -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
                    --  See https://github.com/neovim/nvim-lspconfig/issues/3189
                    library = vim.api.nvim_get_runtime_file("", true),
                },
            })
        end,
        ---@type lspconfig.settings.lua_ls
        settings = {
            Lua = {
                -- Disable formatting (formatting is done by stylua)
                format = { enable = false },
            },
        },
    },
    gopls = {
        settings = {
            gopls = {
                hints = {
                    assignVariableTypes = false,
                    compositeLiteralFields = false,
                    compositeLiteralTypes = false,
                    constantValues = false,
                    functionTypeParameters = false,
                    parameterNames = false,
                    rangeVariableTypes = false,
                },
            },
        },
    },
    -- TODO: ensure it works
    -- typescript
    vtsls = {},
    vue_ls = {},
}
