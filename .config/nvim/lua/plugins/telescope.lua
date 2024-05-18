return {
    "nvim-telescope/telescope.nvim",
    keys = {

        -- SEARCH
        { "<leader><space>", LazyVim.telescope("buffers"), desc = "[] Find existing buffers" },
        { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "[:] Command History" },
        { "<leader>sf", LazyVim.telescope("files", { hidden = true }), desc = "[S]earch [F]iles" },
        { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "[S]earch [K]eymaps" },
        { "<leader>sd", "<cmd>Telescope diagnostics", desc = "[S]earch Diagnostics" },
        { "<leader>sg", LazyVim.telescope("live_grep"), desc = "[S]earch by [G]rep" },
        { "<leader>s.", "<cmd>Telescope oldfiles<cr>", desc = "[S]earch Recent Files ('.' for repeat)" },
        { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "[S]earch [H]elp" },
        { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "[S]earch Current [B]uffer" },
        { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "[S]earch [R]esume" },
        { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "[S]earch VIM [O]ptions" },
        { "<leader>sw", false },
        -- GIT
        { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "[G]it [C]ommits" },
        { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "[G]it [S]tatus" },
        { "<leader>sG", "<cmd>Telescope git_files<cr>", desc = "[S]earch [G]it Files" },
        -- UI
        {
            "<leader>uC",
            LazyVim.telescope("colorscheme", { enable_preview = true }),
            desc = "Colorscheme with Preview",
        },

        -- disabled default lazyvim keymaps
        { "<leader>,", false },
        { "<leader>fb", false },
        { "<leader>/", false },
        { "<leader>fc", false },
        { "<leader>ff", false },
        { "<leader>fF", false },
        { '<leader>s"', false },
        { "<leader>sD", false },
        { "<leader>sG", false },
        { "<leader>fg", false },
        { "<leader>fR", false },
        { "<leader>sa", false },
        { "<leader>sw", false },
        { "<leader>sW", false },
        { "<leader>sW", false },

        { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
        { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
        { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
        { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
        { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
        {
            "<leader>ss",
            function()
                require("telescope.builtin").lsp_document_symbols({
                    symbols = require("lazyvim.config").get_kind_filter(),
                })
            end,
            desc = "Goto Symbol",
        },
        {
            "<leader>sS",
            function()
                require("telescope.builtin").lsp_dynamic_workspace_symbols({
                    symbols = require("lazyvim.config").get_kind_filter(),
                })
            end,
            desc = "Goto Symbol (Workspace)",
        },
    },
}
