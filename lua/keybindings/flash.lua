local map = vim.keymap.set


map('n', 's', function() require("flash").jump() end, {desc = "Flash"})
