return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          week_header = {
            enable = true,
            concat = '- カッコよく見える日本語テキスト',
          },
          packages = { enable = false },
          project = { enable = false },
          mru = { cwd_only = true },
          shortcut = {
            { desc = '[ samkhoo94]', group = 'DashboardShortCut' },
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope git_files',
              key = 'f',
            },
          },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
}
