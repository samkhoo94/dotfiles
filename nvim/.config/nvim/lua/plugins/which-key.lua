return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        plugins = { spelling = true },
        defaults = {
            mode = { "n", "v" },
            ["g"] = { name = "+goto" },
            ["gs"] = { name = "+surround" },
            ["z"] = { name = "+fold" },
            ["]"] = { name = "+next" },
            ["["] = { name = "+prev" },
            ["y"] = { name = "+surround", _ = "which_key_ignore" },
            ["<leader><tab>"] = { name = "[tabs]" },
            ["<leader>b"] = { name = "[b]uffer" },
            ["<leader>c"] = { name = "[c]ode" },
            ["<leader>f"] = { name = "[f]ile/find" },
            ["<leader>g"] = { name = "[g]it" },
            ["<leader>q"] = { name = "[q]uit/session" },
            ["<leader>s"] = { name = "[s]earch" },
            ["<leader>u"] = { name = "[u]i" },
            ["<leader>w"] = { name = "[w]indows" },
            ["<leader>x"] = { name = "diagnostics/quickfi[x]" },
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register(opts.defaults)
    end,
}
