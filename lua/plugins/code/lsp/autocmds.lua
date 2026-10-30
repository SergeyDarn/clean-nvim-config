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
        -- Show Docs for variable under cursor
        --
        map("<leader>cd", vim.lsp.buf.hover, "Docs")
        map("gi", vim.lsp.buf.hover, "Docs")

        --
        -- Show diagnostic (warnings / errors) for the current line
        --
        map("<leader>ce", vim.diagnostic.open_float, "Line Error")
    end,
})
