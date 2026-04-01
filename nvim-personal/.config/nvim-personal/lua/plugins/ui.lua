return {
    -- ─── Statusline ───────────────────────────────────────────────────────────
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "catppuccin",
                globalstatus = true,
                disabled_filetypes = { statusline = { "dashboard" } },
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = function(str) return " " .. str end,
                    },
                },
                lualine_b = { "branch" },
                lualine_c = {
                    {
                        "diagnostics",
                        symbols = { error = " ", warn = " ", info = " ", hint = " " },
                    },
                    { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                    { "filename", path = 1 },
                },
                lualine_x = {
                    {
                        "diff",
                        symbols = { added = " ", modified = " ", removed = " " },
                    },
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates,
                    },
                },
                lualine_y = {
                    { "progress", separator = " ", padding = { left = 1, right = 0 } },
                    { "location", padding = { left = 0, right = 1 } },
                },
                lualine_z = {
                    function() return "  " .. os.date("%R") end,
                },
            },
            extensions = { "neo-tree", "lazy" },
        },
    },

    -- ─── Command line UI ──────────────────────────────────────────────────────
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            cmdline = {
                enabled = true,
                view = "cmdline",
            },
            messages = { enabled = true },
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                },
            },
            presets = {
                bottom_search = false,
                long_message_to_split = true,
            },
        },
    },

    -- ─── Start screen ─────────────────────────────────────────────────────────
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("dashboard").setup({
                theme = "hyper",
                config = {
                    week_header = {
                        enable = true,
                        concat = "- カッコよく見える日本語テキスト",
                    },
                    packages = { enable = false },
                    project = { enable = false },
                    mru = { cwd_only = true },
                    shortcut = {
                        { desc = "[ samkhoo94]", group = "DashboardShortCut" },
                        { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
                        {
                            icon = " ",
                            icon_hl = "@variable",
                            desc = "Files",
                            group = "Label",
                            action = "Telescope git_files",
                            key = "f",
                        },
                    },
                },
            })
        end,
    },

    -- ─── Keymap hints ─────────────────────────────────────────────────────────
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            spec = {
                { "<leader>a", group = "AI" },
                { "<leader>c", group = "Code / Snap" },
                { "<leader>g", group = "Git" },
                { "<leader>s", group = "Search" },
                { "<leader>u", group = "UI" },
            },
        },
    },
}
