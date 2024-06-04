return {
    "mistricky/codesnap.nvim",
    build = "make",
    keys = {
        { "<leader>cy", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
        { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
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
}
