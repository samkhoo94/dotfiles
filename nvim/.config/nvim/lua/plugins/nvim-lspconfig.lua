return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            autoformat = false,
            servers = {
                pylsp = {
                    settings = {
                        pylsp = {
                            plugins = {
                                pycodestyle = { enabled = false },
                                flake8 = {
                                    enabled = true,
                                    maxLineLength = 120,
                                },
                            },
                        },
                    },
                },
                jinja_lsp = {
                    filetypes = { "jinja", "sql" },
                },
                gopls = {},
            },
        },
    },
}
