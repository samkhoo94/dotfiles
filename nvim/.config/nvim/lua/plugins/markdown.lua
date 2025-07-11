return {
    {
        "iamcco/markdown-preview.nvim",
        ft = { "markdown" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_auto_start = 0 -- don't auto-preview on open
            vim.g.mkdp_auto_close = 1 -- auto-close when buffer closes
            vim.g.mkdp_refresh_slow = 0
            vim.g.mkdp_command_for_global = 0
            vim.g.mkdp_open_to_the_world = 0
            vim.g.mkdp_browser = "" -- use system default browser
            vim.g.mkdp_echo_preview_url = 1 -- show URL so you can open it manually if needed
        end,
    },
}
