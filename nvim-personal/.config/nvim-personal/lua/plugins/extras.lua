return {
    -- ─── Code screenshots ─────────────────────────────────────────────────────
    {
        "mistricky/codesnap.nvim",
        build = "make",
        keys = {
            { "<leader>cy", "<cmd>CodeSnap<cr>", mode = "x", desc = "CodeSnap: Copy to Clipboard" },
            { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "CodeSnap: Save to ~/Pictures" },
        },
        opts = {
            save_path = "~/Pictures",
            mac_window_bar = false,
            code_font_family = "ShureTechMono Nerd Font",
            has_breadcrumbs = false,
            has_line_seperator = false,
            bg_theme = "grape",
            watermark = "",
        },
    },

    -- ─── Markdown preview ─────────────────────────────────────────────────────
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        ft = "markdown",
        config = function()
            vim.g.mkdp_auto_start = 0
            vim.g.mkdp_auto_close = 1
        end,
    },
}
