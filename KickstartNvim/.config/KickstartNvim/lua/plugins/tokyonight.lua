return { -- You can easily change to a different colorscheme.
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    require('tokyonight').setup {
      style = 'storm',
      transparent = true,
    }
    -- Load the colorscheme here.
    -- Other styles: 'tokyonight-night', 'tokyonight-moon', 'tokyonight-day'.
    vim.cmd.colorscheme 'tokyonight'

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
