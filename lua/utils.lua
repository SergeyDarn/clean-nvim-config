local M = {}

M.split_vertical = function(buffer_name)
    local cmd = string.format(":botright vsplit %s", buffer_name)

    vim.cmd(cmd)
end

M.split_horizontal = function(buffer_name)
    local cmd = string.format(":botright split %s", buffer_name)

    vim.cmd(cmd)
end

return M
