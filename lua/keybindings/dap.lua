local hover = function()
  require('dap.ui.widgets').hover()
end

local preview = function()
  require('dap.ui.widgets').preview()
end

local frames = function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end

local scopes = function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end

vim.keymap.set('n', '<F5>', function() require('dapui').open() require('dap').continue() end, {desc = "Continue"})
vim.keymap.set('n', '<F6>', function() require('dap').close() require('dapui').close() end, {desc = "Close"})
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, {desc = "Step Over"})
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, {desc = "Step Into"})
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, {desc = "Step Out"})
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end, {desc = "Toggle Breakpoint"})
vim.keymap.set('n', '<leader>B', function() require('dap').set_breakpoint() end, {desc = "Set Breakpoint"})
vim.keymap.set('n', '<leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end, {desc = "Open REPL"})
vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end, {desc = "Run Last"})
vim.keymap.set({'n', 'l'}, '<leader>dh', hover)
vim.keymap.set({'n', 'v'}, '<leader>dp', preview)
vim.keymap.set('n', '<leader>df', frames)
vim.keymap.set('n', '<leader>ds', scopes)
vim.keymap.set('n', '<leader>dt', function() require('dapui').toggle() end, {desc = "Toggle DAP UI"})

