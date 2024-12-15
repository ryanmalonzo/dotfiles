return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      indent = { enabled = true },
      quickfile = { enabled = true },
    },
    keys = {
      { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit" },
    },
  },
}
