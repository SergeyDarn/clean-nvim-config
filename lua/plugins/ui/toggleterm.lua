--
-- NOTE: toggleterm's border color doesn't match all other floating windows
-- Can fix later
--
require("toggleterm").setup({
    size = nil,
    direction = "float",
    open_mapping = [[<leader>t]],
    insert_mappings = false,
    float_opts = {
        border = "curved",
        width = 65,
        height = 15,
    },
})
