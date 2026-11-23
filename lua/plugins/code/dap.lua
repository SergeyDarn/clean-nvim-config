local dap = require("dap")
local dapView = require("dap-view")

dapView.setup({})
require("nvim-dap-virtual-text").setup({})
require("dap-go").setup({})

vim.keymap.set("n", "<leader>dv", dapView.toggle, { desc = "Debug: open view" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })
vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "Debug: start/stop" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: continue" })
vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Debug: restart" })

vim.keymap.set("n", "<leader>dj", dap.step_over, { desc = "Debug: step over" })
vim.keymap.set("n", "<leader>dl", dap.step_into, { desc = "Debug: step into" })
vim.keymap.set("n", "<leader>dh", dap.step_out, { desc = "Debug: step out" })

vim.fn.sign_define("DapBreakpoint", { text = "🍎", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "❓", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "💬", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "➡️", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "⚠️", texthl = "", linehl = "", numhl = "" })
