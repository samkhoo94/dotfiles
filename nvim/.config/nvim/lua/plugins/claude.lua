return {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    cmd = "ClaudeCode",
    opts = {
        terminal_cmd = vim.fn.expand("~/.local/bin/claude"),
    },
    config = function(_, opts)
        require("claudecode").setup(opts)
    end,
    keys = {
        { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    },
}
