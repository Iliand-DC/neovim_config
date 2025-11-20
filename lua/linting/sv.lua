return {
    setupLinter = function (lint)
        lint.linters_by_ft = {
            systemverilog = { 'verilator' },
            verilog = { 'verilator' },
        }

        local verilator = lint.linters.verilator

        -- Add/change arguments for Verilator here.
        -- You can also use or re-use a verilator.f file (see example\verilator.f)
        -- placed anywhere between CWD and your home dir and it
        -- will be read by Verilator

        -- The arguments below are the default provided by nvim-lint
        -- (https://github.com/mfussenegger/nvim-lint/blob/master/lua/lint/linters/verilator.lua)
        -- with the exception of the '-f' and corresponding path to verilator.f
        verilator.args = {
            "-Wall",
            "-Wno-MODDUP",
            "--timing",
            "--lint-only",
            "-f",
            vim.fs.find('rtl.f', {upward = true, stop = vim.env.HOME})[1],
        }

        lint.linters.verilator = verilator
    end
}
