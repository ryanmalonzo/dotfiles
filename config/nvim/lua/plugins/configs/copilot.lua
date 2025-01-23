require("copilot").setup {
  panel = {
    enabled = false,
  },
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<C-x>",
    },
  },
  filetypes = {
    yaml = true,
    markdown = true,
  },
}
