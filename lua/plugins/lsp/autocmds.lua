vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        --
        -- Rename the variable under your cursor.
        -- Most Language Servers support renaming across files, etc.
        --
        map("<leader>cr", vim.lsp.buf.rename, "Rename")

        --
        -- Show diagnostic (warnings / errors) for the current line
        --
        map("<leader>cd", vim.diagnostic.open_float, "Line diagnostic")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method("textDocument/inlayHint", event.buf) then
            map("<leader>ch", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, "Toggle inlay hints")
        end
    end,
})
