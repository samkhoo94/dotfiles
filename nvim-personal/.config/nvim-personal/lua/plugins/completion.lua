return {
    "saghen/blink.cmp",
    version = "*",
    event = "InsertEnter",
    opts = {
        keymap = { preset = "default" },
        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = "mono",
        },
        sources = {
            default = { "lsp", "path", "buffer" },
        },
        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 200 },
        },
    },
}
