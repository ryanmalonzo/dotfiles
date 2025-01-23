local map = vim.keymap.set

-- general mappings
map("n", "<C-c>", "<cmd> %y+ <CR>") -- copy whole file content
map("n", "<C-v>", "<cmd> %d | 0put+ <CR>") -- replace whole file content with clipboard

-- float diagnostics
map("n", "<leader>xx", "<cmd>lua vim.diagnostic.open_float()<CR>")

-- oil
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- clear highlights on search when pressing <Esc> in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- keybinds to make split navigation easier
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- duplicate a line and comment out the first line
map("n", "yc", "yy<cmd>normal gcc<CR>p")

-- leap
map({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
map({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
