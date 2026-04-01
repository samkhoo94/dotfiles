return {
    -- ─── Mason: LSP installer ─────────────────────────────────────────────────
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {},
    },

    -- ─── Mason <-> lspconfig bridge ───────────────────────────────────────────
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = { "pylsp", "gopls", "lua_ls" },
            automatic_installation = true,
        },
    },

    -- ─── Language servers ─────────────────────────────────────────────────────
    -- nvim-lspconfig provides cmd/filetypes/root_dir defaults for each server.
    -- Configuration is done via vim.lsp.config (native Neovim 0.11+ API).
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- Global defaults applied to all servers
            vim.lsp.config("*", { capabilities = capabilities })

            -- Python
            vim.lsp.config("pylsp", {
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = { enabled = false },
                            flake8 = { enabled = true, maxLineLength = 120 },
                        },
                    },
                },
            })

            -- Jinja / SQL templating (DBT)
            vim.lsp.config("jinja_lsp", {
                filetypes = { "jinja", "sql" },
            })

            -- Lua (for editing Neovim config)
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = {
                            checkThirdParty = false,
                            library = { vim.env.VIMRUNTIME },
                        },
                        diagnostics = { globals = { "vim" } },
                    },
                },
            })

            vim.lsp.enable({ "pylsp", "jinja_lsp", "gopls", "lua_ls" })

            -- ─── Diagnostics UI ───────────────────────────────────────────────

            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.INFO] = " ",
                        [vim.diagnostic.severity.HINT] = " ",
                    },
                },
                underline = true,
                update_in_insert = false,
                virtual_text = { spacing = 4, prefix = "●" },
            })

            -- ─── Keymaps (set when LSP attaches to a buffer) ──────────────────

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
                    end

                    map("gd", vim.lsp.buf.definition, "Go to Definition")
                    map("gD", vim.lsp.buf.declaration, "Go to Declaration")
                    map("gr", vim.lsp.buf.references, "Go to References")
                    map("gi", vim.lsp.buf.implementation, "Go to Implementation")
                    map("K", vim.lsp.buf.hover, "Hover Documentation")
                    map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
                    map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
                    map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
                end,
            })
        end,
    },
}
