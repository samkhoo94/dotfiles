-- Treat .sql files as Jinja (for SQL templating with DBT etc.)
vim.filetype.add({
    extension = {
        sql = "jinja",
    },
})

-- Disable autoformat for Python
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.b.autoformat = false
    end,
})

-- Highlight briefly when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})
