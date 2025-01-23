local o = vim.o

vim.g.mapleader = " "

o.laststatus = 4 -- global statusline
o.showmode = false

vim.schedule(function()
  o.clipboard = "unnamedplus"
end)

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

vim.opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

o.number = true
-- o.relativenumber = true

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.timeoutlen = 400
o.updatetime = 250
o.undofile = true
o.cursorline = true

-- Preview substitution lines
o.inccommand = "split"

-- Minimal number of screen lines to keep above and below the cursor
o.scrolloff = 10

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

vim.api.nvim_set_hl(0, "IndentLine", { link = "Comment" })
