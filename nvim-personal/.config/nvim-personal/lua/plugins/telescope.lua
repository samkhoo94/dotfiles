return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-telescope/telescope-file-browser.nvim",
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            telescope.setup({
                defaults = {
                    file_ignore_patterns = { ".git/" },
                },
                extensions = {
                    file_browser = { hijack_netrw = true },
                },
            })

            telescope.load_extension("fzf")
            telescope.load_extension("file_browser")

            -- ─── Search ───────────────────────────────────────────────────────

            vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "Find Buffers" })
            vim.keymap.set("n", "<leader>sf", function()
                builtin.find_files({ hidden = true })
            end, { desc = "[S]earch [F]iles" })
            vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
            vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
            vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
            vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "[S]earch Recent Files" })
            vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
            vim.keymap.set("n", "<leader>sb", builtin.current_buffer_fuzzy_find, { desc = "[S]earch Current [B]uffer" })
            vim.keymap.set("n", "<leader>sR", builtin.resume, { desc = "[S]earch [R]esume" })
            vim.keymap.set("n", "<leader>so", builtin.vim_options, { desc = "[S]earch VIM [O]ptions" })
            vim.keymap.set("n", "<leader>sC", builtin.commands, { desc = "[S]earch [C]ommands" })
            vim.keymap.set("n", "<leader>sH", builtin.highlights, { desc = "[S]earch [H]ighlight Groups" })
            vim.keymap.set("n", "<leader>sM", builtin.man_pages, { desc = "[S]earch [M]an Pages" })
            vim.keymap.set("n", "<leader>sm", builtin.marks, { desc = "[S]earch [M]arks" })
            vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "[S]earch Document [S]ymbols" })
            vim.keymap.set("n", "<leader>sS", builtin.lsp_dynamic_workspace_symbols, { desc = "[S]earch Workspace [S]ymbols" })
            vim.keymap.set("v", "<leader>sw", builtin.grep_string, { desc = "[S]earch [W]ord Under Cursor" })

            -- ─── Git ──────────────────────────────────────────────────────────

            vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "[G]it [C]ommits" })
            vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "[G]it [S]tatus" })
            vim.keymap.set("n", "<leader>sG", builtin.git_files, { desc = "[S]earch [G]it Files" })

            -- ─── UI ───────────────────────────────────────────────────────────

            vim.keymap.set("n", "<leader>uC", function()
                builtin.colorscheme({ enable_preview = true })
            end, { desc = "Colorscheme with Preview" })

            -- ─── File browser ─────────────────────────────────────────────────

            vim.keymap.set("n", "<leader>sB", function()
                telescope.extensions.file_browser.file_browser({ path = "%:p:h" })
            end, { desc = "[S]earch File [B]rowser" })

            -- ─── Command history ──────────────────────────────────────────────

            vim.keymap.set("n", "<leader>:", builtin.command_history, { desc = "Command History" })
        end,
    },
}
