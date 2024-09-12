-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.winbar = "%=%m %f"

vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

vim.o.scrolloff = 10 -- Minimal amount of lines to keep above or below the cursor

vim.o.showmode = false
-- vim.g.autoformat = false
--
--
local client = vim.lsp.start_client({
    name = "samlsp",
    cmd = { "/home/skhoo/programming/go/samlsp/main" },
})

if not client then
    vim.notify("Hey you didn't do the client thing good")
    return
end

vim.api.nvim_create_autocmd("Filetype", {
    pattern = "markdown",
    callback = function()
        vim.lsp.buf_attach_client(0, client)
    end,
})
