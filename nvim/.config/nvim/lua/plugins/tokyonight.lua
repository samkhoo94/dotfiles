return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "storm",
            transparent = true,
            on_highlights = function(hl, c)
                -- Relative line numbers default to fg_gutter, too dark to read.
                hl.LineNrAbove = { fg = c.comment }
                hl.LineNrBelow = { fg = c.comment }
            end,
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.api.nvim_create_autocmd("VimEnter", {
                once = true,
                callback = function()
                    vim.cmd.colorscheme("tokyonight")
                end,
            })
        end,
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
        },
    },
}
