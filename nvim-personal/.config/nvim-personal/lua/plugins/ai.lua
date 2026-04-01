return {
    -- ─── GitHub Copilot ───────────────────────────────────────────────────────
    {
        "github/copilot.vim",
        event = "InsertEnter",
    },

    -- ─── Claude Code ──────────────────────────────────────────────────────────
    {
        "coder/claudecode.nvim",
        cmd = "ClaudeCode",
        opts = {
            terminal_cmd = vim.fn.expand("~/.local/bin/claude"),
        },
        keys = {
            { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
        },
    },
}
