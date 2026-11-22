--
-- More Search
--
vim.keymap.set("n", "<leader>sh", function()
    Snacks.picker.help({
        layout = "telescope",
    })
end, { desc = "Help" })

vim.keymap.set("n", "<leader>se", function()
    Snacks.picker.diagnostics()
end, { desc = "Code Errors" })

vim.keymap.set("n", "<leader>sp", function()
    Snacks.picker.projects({ layout = "select" })
end, { desc = "Projects" })

vim.keymap.set("n", "<leader>si", function()
    Snacks.picker.icons()
end, { desc = "Icons" })

vim.keymap.set("n", "<leader>s.", function()
    Snacks.picker.scratch()
end, { desc = "Scratches" })

vim.keymap.set("n", "<leader>st", function()
    Snacks.picker.todo_comments()
end, { desc = "Todos" })

vim.keymap.set("n", "<leader>z", function()
    Snacks.picker.zoxide({ layout = "select" })
end, { desc = "Zoxide" })

vim.keymap.set("n", "<leader>sl", function()
    local chainsawMarker = require("chainsaw.config.config").config.marker

    Snacks.picker.grep_word({
        title = chainsawMarker .. " log statements",
        cmd = "rg",
        args = { "--trim" },
        search = chainsawMarker,
        regex = false,
        live = false,
    })
end, { desc = "Logs" })

vim.keymap.set("n", "<leader>sk", function()
    Snacks.picker.keymaps()
end, { desc = "Keymaps" })

vim.keymap.set("n", "<leader>ms", function()
    Snacks.picker.grep_word({
        title = "Todos",
        cmd = "rg",
        search = "^\\s*- \\[([ xX])\\]", -- Matches '- [ ]', '- [x]', or '- [X]'
        regex = true,
        glob = "*.md",
    })
end, { desc = "Markdown Todos" })

vim.keymap.set("n", "<leader>md", function()
    Snacks.picker.grep_word({
        title = "Completed Todos",
        cmd = "rg",
        search = "^\\s*- \\[([xX])\\]", -- Matches '- [x]', or '- [X]'
        regex = true,
        glob = "*.md",
    })
end, { desc = "Markdown Completed Todos" })

local excluded_global_dirs = {
    "Library",
    "Documents",
    "Music",
    "Movies",
    ".local",
    "go",
    "go.sum",
    ".cache",
    ".cargo",
    ".oh-my-zsh",
    ".ollama",
    ".rustup",
    ".nvm",
    ".yarn",
    ".npm",
    ".zsh_sessions",
    "node_modules",
    ".venv",
}

vim.keymap.set("n", "<leader>sg", function()
    Snacks.picker.files({
        dirs = { "~" },
        exclude = excluded_global_dirs,
        hidden = true,
        ignored = true,
    })
end, { desc = "Global" })

local function get_excluded_global_dirs_fd_args()
    local FD_EXCLUDE_ARG_NAME = "-E"
    local excluded_dirs = {}

    for _, dir in ipairs(excluded_global_dirs) do
        table.insert(excluded_dirs, FD_EXCLUDE_ARG_NAME)
        table.insert(excluded_dirs, dir)
    end

    return excluded_dirs
end

vim.keymap.set("n", "<leader>sd", function()
    Snacks.picker({
        finder = "proc",
        preview = "directory",
        cmd = "fd",
        args = {
            "-td", -- search only for directories
            "-I", -- include ignored directories
            unpack(get_excluded_global_dirs_fd_args()),
        },
        cwd = "~",
        transform = function(item)
            item.file = "~/" .. item.text
            item.dir = true
        end,
        confirm = function(picker, item)
            picker:close()

            Snacks.picker.grep({
                regex = false,
                cwd = item.file,
            })
        end,
    })
end, { desc = "Directories" })

vim.keymap.set("n", "<leader>sn", function()
    Snacks.picker.files({
        dirs = { "~/Synced/Notes" },
    })
end, { desc = "Notes" })

vim.keymap.set("n", "<leader>sl", function()
    Snacks.picker.highlights()
end, { desc = "Highlights" })

vim.keymap.set("n", "<leader>sb", function()
    Snacks.picker.buffers()
end, { desc = "Buffers" })
