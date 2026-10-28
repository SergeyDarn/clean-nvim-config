require("snacks").setup({
    notifier = { enabled = true },
    explorer = { enabled = true },
    scratch = {
        enabled = true,
        ft = "markdown",
        win = {
            width = 0.8,
            height = 0.8,
        },
    },
    picker = {
        enabled = true,
        sources = {
            explorer = {
                auto_close = true,
                layout = {
                    preset = "default",
                    layout = {
                        min_width = 0,
                        width = 0.6,
                    },
                },
            },
        },
        layout = {
            preset = function()
                return "telescope"
            end,
        },
        layouts = {
            telescope = {
                layout = {
                    box = "horizontal",
                    backdrop = false,
                    width = 0.9,
                    height = 0.9,
                    border = "none",
                    {
                        box = "vertical",
                        { win = "list", title = " Results ", title_pos = "center", border = true },
                        {
                            win = "input",
                            height = 1,
                            border = true,
                            title = "{title} {live} {flags}",
                            title_pos = "center",
                        },
                    },
                    {
                        win = "preview",
                        title = "{preview:Preview}",
                        width = 0.65,
                        border = true,
                        title_pos = "center",
                    },
                },
            },
            default = {
                layout = {
                    box = "horizontal",
                    width = 0.8,
                    min_width = 90,
                    min_height = 20,
                    height = 0.8,
                    {
                        box = "vertical",
                        border = "rounded",
                        title = "{title} {live} {flags}",
                        { win = "input", height = 1, border = "bottom" },
                        { win = "list", border = "none" },
                    },
                    { win = "preview", title = "{preview}", border = "rounded", width = 0.7 },
                },
            },
        },
    },
})

--
-- Main
--
vim.keymap.set("n", "<leader><space>", function()
    Snacks.picker.smart()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>/", function()
    Snacks.picker.grep()
end, { desc = "Search" })

vim.keymap.set("n", "/", function()
    Snacks.picker.lines()
end, { desc = "Search Current File" })

vim.keymap.set("n", "<leader>:", function()
    Snacks.picker.command_history()
end, { desc = "Command History" })

vim.keymap.set("n", "<leader>.", function()
    Snacks.scratch.open()
end, { desc = "Notes" })

--
-- Other Search
--
vim.keymap.set("n", "<leader>sh", function()
    Snacks.picker.help()
end, { desc = "Search Help" })

vim.keymap.set("n", "<leader>sd", function()
    Snacks.picker.diagnostics()
end, { desc = "Search Diagnostics" })

vim.keymap.set("n", "<leader>sp", function()
    Snacks.picker.projects()
end, { desc = "Search Projects" })

vim.keymap.set("n", "<leader>sr", function()
    Snacks.picker.recent()
end, { desc = "Search Recent" })

vim.keymap.set("n", "<leader>si", function()
    Snacks.picker.icons()
end, { desc = "Search Icons" })

vim.keymap.set("n", "<leader>s.", function()
    Snacks.picker.scratch()
end, { desc = "Search Notes" })

--
-- File Explorer
--
vim.keymap.set("n", "<leader>e", function()
    Snacks.explorer()
end, { desc = "Toggle File Explorer" })

--
-- Notifications
--
vim.keymap.set("n", "<leader>n", function()
    Snacks.notifier.show_history()
end, { desc = "Notification History" })

--
-- LSP
--
vim.keymap.set("n", "<leader>cl", function()
    Snacks.picker.lsp_config()
end, { desc = "LSP: Info" })

vim.keymap.set("n", "gd", function()
    Snacks.picker.lsp_definitions()
end, { desc = "LSP: Go to Definition" })

vim.keymap.set("n", "gr", function()
    Snacks.picker.lsp_references()
end, { desc = "LSP: References" })

--
-- Lazygit
--
vim.keymap.set("n", "<leader>gg", function()
    Snacks.lazygit()
end, { desc = "Lazygit" })

--
-- Git
--
vim.keymap.set("n", "<leader>gb", function()
    Snacks.picker.git_log_line()
end, { desc = "Git Blame" })

vim.keymap.set("n", "<leader>gl", function()
    Snacks.picker.git_log_file()
end, { desc = "Git File History" })

vim.keymap.set("n", "<leader>gd", function()
    Snacks.picker.git_diff()
end, { desc = "Git Diff" })
