return {
  "folke/noice.nvim",
  opts = {
    -- add any options here
    cmdline = {
      enabled = true,
      view = "cmdline",
    },
    routes = {
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
    },
  },
}
