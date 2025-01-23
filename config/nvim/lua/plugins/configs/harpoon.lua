local harpoon = require "harpoon"

harpoon:setup()

vim.keymap.set("n", "<C-a>", function()
  harpoon:list():add()
end)
vim.keymap.set("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<C-&>", function()
  harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-é>", function()
  harpoon:list():select(2)
end)
vim.keymap.set("n", '<C-">', function()
  harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-'>", function()
  harpoon:list():select(4)
end)
vim.keymap.set("n", "<C-(>", function()
  harpoon:list():select(5)
end)
vim.keymap.set("n", "<C-§>", function()
  harpoon:list():select(6)
end)
vim.keymap.set("n", "<C-è>", function()
  harpoon:list():select(7)
end)
vim.keymap.set("n", "<C-!>", function()
  harpoon:list():select(8)
end)
vim.keymap.set("n", "<C-ç>", function()
  harpoon:list():select(9)
end)
