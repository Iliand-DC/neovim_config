require("agentic").setup({
    provider = "opencode-acp",
    acp_providers = {
        ["opencode-acp"] = {
            command = "opencode",
            args = { "acp" },
        }
    }
})

vim.keymap.set({ "n" }, "<C-'>", ":lua require('agentic').toggle()<CR>", { desc = "Toggle Agentic Chat" })
