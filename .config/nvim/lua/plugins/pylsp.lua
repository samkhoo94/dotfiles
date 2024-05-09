return {
  {
    "neovim/nvim-lspconfig",
    opts = {
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
      },
    },
  },
}
