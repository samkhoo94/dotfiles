return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        plugins = { spelling = true },
        defaults = {
            mode = { "n", "v" },
            { "<leader><tab>", group = "[tabs]" },
            { "<leader>b", group = "[b]uffer" },
            { "<leader>c", group = "[c]ode" },
            { "<leader>f", group = "[f]ile/find" },
            { "<leader>g", group = "[g]it" },
            { "<leader>q", group = "[q]uit/session" },
            { "<leader>s", group = "[s]earch" },
            { "<leader>u", group = "[u]i" },
            { "<leader>w", group = "[w]indows" },
            { "<leader>x", group = "diagnostics/quickfi[x]" },
            { "[", group = "prev" },
            { "]", group = "next" },
            { "g", group = "goto" },
            { "gs", group = "surround" },
            { "y", group = "surround" },
            { "y_", hidden = true },
            { "z", group = "fold" },
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
    end,
}
