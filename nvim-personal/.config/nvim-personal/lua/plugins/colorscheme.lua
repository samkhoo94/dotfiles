return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        transparent_background = true,
        dim_inactive = { enabled = false },
    },
    init = function()
        vim.cmd.colorscheme("catppuccin")
    end,
}
