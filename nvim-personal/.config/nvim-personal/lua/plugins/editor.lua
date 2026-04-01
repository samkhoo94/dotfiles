return {
    -- ─── Surround: add/change/delete brackets, quotes, tags ──────────────────
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {},
    },

    -- ─── Tmux navigator: seamless Neovim/tmux pane switching (normal mode only)
    {
        "christoomey/vim-tmux-navigator",
        keys = {
            { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate Left" },
            { "<c-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate Down" },
            { "<c-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate Up" },
            { "<c-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate Right" },
            { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Navigate Previous" },
        },
    },
}
