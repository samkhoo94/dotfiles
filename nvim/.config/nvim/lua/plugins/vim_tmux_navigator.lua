-- vim-tmux-navigator still owns <C-h/j/k/l> for real tmux. Under herdr, its
-- mappings are disabled and vim-herdr-navigation's editor/nvim.lua (vendored
-- at herdr/.config/herdr/plugins/vim-herdr-navigation/editor/nvim.lua) takes
-- over instead — same idea, herdr-aware. It also falls back to tmux/wincmd on
-- its own, so nothing breaks outside herdr.
-- https://github.com/paulbkim-dev/vim-herdr-navigation
--
-- To revert to plain tmux: delete the `return { ... }` block below and
-- uncomment this original tmux-only spec instead.
--
-- return {
--   "christoomey/vim-tmux-navigator",
--   cmd = {
--     "TmuxNavigateLeft",
--     "TmuxNavigateDown",
--     "TmuxNavigateUp",
--     "TmuxNavigateRight",
--     "TmuxNavigatePrevious",
--   },
--   keys = {
--     { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
--     { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
--     { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
--     { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
--     { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
--   },
-- }

return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
  config = function()
    -- LazyVim's own <C-h/j/k/l> = <C-w>h/j/k/l keymaps load on the `VeryLazy`
    -- event (lazyvim/config/keymaps.lua), which fires after this config()
    -- already ran — so it silently overwrites ours unless we also apply
    -- ours on VeryLazy, registered after LazyVim's own so ours wins.
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      once = true,
      callback = function()
        dofile(vim.fn.expand("~/.config/herdr/plugins/vim-herdr-navigation/editor/nvim.lua"))
      end,
    })
  end,
}
