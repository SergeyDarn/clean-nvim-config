-- Special Lua Config, as recommended by neovim help docs
return {
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
                -- lua language server is super confused when editing lua files in the config
                -- and raises a lot of [duplicate-doc-field] warnings
                library = vim.tbl_filter(function(d)
                    return not d:match(vim.fn.stdpath("config") .. "/?a?f?t?e?r?")
                end, vim.api.nvim_get_runtime_file("", true)),
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
}
