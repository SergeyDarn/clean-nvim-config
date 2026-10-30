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
            border = "rounded",
            max_height = 15,
            anchor_bias = "below",
        }

        --
        -- Show Docs for code under cursor
        --
        local showHover = function()
            vim.lsp.buf.hover(vim.tbl_extend("keep", {
                max_width = 60,
            }, WINDOW_CONFIG))
        end
        map("<leader>cd", showHover, "Docs")
        map("gi", showHover, "Docs")

        --
        -- Show diagnostic (warnings / errors) for the current line
        --
        local showDiagnostic = function()
            vim.diagnostic.open_float(vim.tbl_extend("keep", {
                max_width = 50,
            }, WINDOW_CONFIG))
        end
        map("<leader>ce", showDiagnostic, "Line Error")
        map("ge", showDiagnostic, "Line Error")
    end,
})
