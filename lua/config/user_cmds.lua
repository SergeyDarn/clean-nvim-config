--
-- Manage plugins with Vim Pack
--
vim.api.nvim_create_user_command("VimPackAdd", function(opts)
    vim.pack.add(opts.fargs)
end, { nargs = "+", desc = "Add VimPack Plugin" })

vim.api.nvim_create_user_command("VimPackDel", function(opts)
    vim.pack.del(opts.fargs)
end, { nargs = "+", desc = "Delete VimPack Plugin" })

vim.api.nvim_create_user_command("VimPackUpdate", function()
    vim.pack.update()
end, { desc = "Update VimPack Plugins" })
