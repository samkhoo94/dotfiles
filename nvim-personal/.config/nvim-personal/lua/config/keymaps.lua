-- ─── Navigation ───────────────────────────────────────────────────────────────

-- Half-page jumping, keep cursor centred
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- ─── Editing ──────────────────────────────────────────────────────────────────

-- Move selected lines up/down with auto-reindent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste last yanked text in insert mode
vim.keymap.set("i", "<c-v>", "<c-R>0")

-- Clear search highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- ─── Splits ───────────────────────────────────────────────────────────────────

vim.keymap.set("n", "<leader>|", "<cmd>vsplit<CR>", { desc = "Vertical Split" })
vim.keymap.set("n", "<leader>-", "<cmd>split<CR>", { desc = "Horizontal Split" })
vim.keymap.set("n", "<leader>wd", "<cmd>close<CR>", { desc = "Close Window" })

-- ─── Terminal navigation ──────────────────────────────────────────────────────
-- Exit terminal mode then move to adjacent Neovim window (e.g. Claude pane → code)
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Terminal: Navigate Left" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Terminal: Navigate Down" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Terminal: Navigate Up" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Terminal: Navigate Right" })

-- ─── Copilot ──────────────────────────────────────────────────────────────────

vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true
