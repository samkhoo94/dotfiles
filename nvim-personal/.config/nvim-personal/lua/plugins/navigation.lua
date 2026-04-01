return {
    -- ─── Harpoon: quick file bookmarking ──────────────────────────────────────
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            menu = { width = vim.api.nvim_win_get_width(0) - 4 },
            settings = { save_on_toggle = true },
        },
        keys = function()
            local keys = {
                {
                    "<leader>H",
                    function() require("harpoon"):list():add() end,
                    desc = "Harpoon: Add File",
                },
                {
                    "<leader>h",
                    function()
                        local harpoon = require("harpoon")
                        harpoon.ui:toggle_quick_menu(harpoon:list())
                    end,
                    desc = "Harpoon: Quick Menu",
                },
            }
            for i = 1, 5 do
                table.insert(keys, {
                    "<leader>" .. i,
                    function() require("harpoon"):list():select(i) end,
                    desc = "Harpoon: File " .. i,
                })
            end
            return keys
        end,
    },

    -- ─── Flash: enhanced motion ───────────────────────────────────────────────
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = { search = { enabled = false } },
        },
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-a>", mode = "c", function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },

    -- ─── Neo-tree: file explorer ──────────────────────────────────────────────
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle File Explorer" },
        },
        opts = {
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
        },
    },
}
