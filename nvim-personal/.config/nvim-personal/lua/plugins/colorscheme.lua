return {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
        style = "storm",
        transparent = true,
    },
    init = function()
        vim.cmd.colorscheme("tokyonight")
    end,
}
