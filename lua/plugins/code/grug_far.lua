local gragfar = require("grug-far")

gragfar.setup({})

vim.keymap.set({ "n", "x" }, "<leader>sr", function()
    local mode = vim.api.nvim_get_mode().mode
    local startInInsertMode = mode ~= "v"

    gragfar.open({
        windowCreationCommand = "botright vsplit",
        startInInsertMode = startInInsertMode,
    })
end, { desc = "Search and Replace with GrugFar" })
