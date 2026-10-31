local prettier_args = {
    prepend_args = {
        "--tab-width=4",
        "--use-tabs=false",
        "--single-quote=true",
        "--no-semi",
        -- Crucial: ensures local .prettierrc files override these defaults
        "--config-precedence=prefer-file",
    },
}

require("conform").setup({
    notify_on_error = false,
    format_on_save = function(bufnr)
        local enabled_filetypes = {
            lua = true,
            go = true,
            json = true,
            toml = true,
        }

        if enabled_filetypes[vim.bo[bufnr].filetype] then
            return { timeout_ms = 500, lsp_format = "fallback" }
        else
            return nil
        end
    end,

    default_format_opts = {
        lsp_format = "fallback", -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
    },
    -- You can also specify external formatters in here.
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofumpt" },
        json = { "prettierd", "prettier", "jq", stop_after_first = true },
        toml = { "taplo" },
        -- rust = { 'rustfmt' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    formatters = {
        prettierd = prettier_args,
        prettier = prettier_args,
    },
})

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
    require("conform").format({ async = true })
end, { desc = "Format file" })
