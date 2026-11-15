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

        --- @class vim.lsp.util.open_floating_preview.Opts
        local WINDOW_CONFIG = {
            border = vim.g.border_type,
            max_height = 15,
            anchor_bias = "below",
        }

        --
        -- Show Docs for code under cursor
        --
        map("gi", function()
            vim.lsp.buf.hover(vim.tbl_extend("keep", {
                max_width = 60,
            }, WINDOW_CONFIG))
        end, "Code Docs")

        --
        -- Show diagnostic (warnings / errors) for the current line
        --
        map("ge", function()
            vim.diagnostic.open_float(vim.tbl_extend("keep", {
                max_width = 50,
            }, WINDOW_CONFIG))
        end, "Line Error")

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if client and client:supports_method("textDocument/documentHighlight", event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })

            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })

                    --
                    -- Stop the lsp after all the buffers with it are closed
                    -- (Primarily neededfor lua-lsp that eats up more than 1gb of ram
                    --  + there are multiple of them - 1 per lua project
                    --  + sometimes they duplicate too)
                    --
                    -- During LspDetach, the closing buffer is still in the list,
                    -- so a count of 1 (or 0) means no other buffers are using it.
                    if #client.attached_buffers <= 1 then
                        client:stop()
                    end
                end,
            })
        end
    end,
})
