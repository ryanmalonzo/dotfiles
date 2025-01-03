vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.swapfile = false

vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Hide the mode since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim (scheduled to avoid increasing startup time)
vim.schedule(function() vim.opt.clipboard = "unnamedplus" end)

vim.opt.undofile = true

-- Smart search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Preview substitutions live
vim.opt.inccommand = "split"

-- Highlight line the cursor is currently on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Duplicate a line and comment out the first line
vim.keymap.set("n", "yc", "yy<cmd>normal gcc<CR>p")

-- Available in nightly
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "grn", vim.lsp.buf.rename)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action)
vim.keymap.set("n", "grr", vim.lsp.buf.references)

require "config.lazy"
