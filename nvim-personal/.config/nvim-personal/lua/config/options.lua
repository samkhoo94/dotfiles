-- ─── UI ───────────────────────────────────────────────────────────────────────

vim.opt.number = true           -- Line numbers
vim.opt.relativenumber = true   -- Relative line numbers
vim.opt.signcolumn = "yes"      -- Always show sign column (prevents layout shift)
vim.opt.winbar = "%=%m %f"      -- Show filename + modified flag in winbar
vim.opt.showmode = false        -- Mode is shown in the statusline (lualine)
vim.opt.termguicolors = true    -- True colour support
vim.opt.cursorline = true       -- Highlight current line

-- ─── Indentation ──────────────────────────────────────────────────────────────

vim.opt.expandtab = true        -- Spaces instead of tabs
vim.opt.softtabstop = 4         -- Spaces per tab keypress
vim.opt.shiftwidth = 4          -- Spaces per indent level
vim.opt.smartindent = true      -- Auto-indent new lines

-- ─── Editing ──────────────────────────────────────────────────────────────────

vim.opt.scrolloff = 10          -- Lines of context above/below cursor
vim.opt.wrap = false            -- No line wrapping
vim.opt.undofile = true         -- Persistent undo across sessions
vim.opt.updatetime = 250        -- Faster CursorHold events (used by LSP)
vim.opt.splitright = true       -- Vertical splits open to the right
vim.opt.splitbelow = true       -- Horizontal splits open below

-- ─── Search ───────────────────────────────────────────────────────────────────

vim.opt.ignorecase = true       -- Case-insensitive search...
vim.opt.smartcase = true        -- ...unless pattern has uppercase
vim.opt.hlsearch = true         -- Highlight all search matches
