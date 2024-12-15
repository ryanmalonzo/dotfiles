return {
  {
    "folke/snacks.nvim",
    enabled = true,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      indent = { enabled = true },
      quickfile = { enabled = true },
    },
    event = "VeryLazy",
    keys = {
      { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit" },
    },
  },
}
