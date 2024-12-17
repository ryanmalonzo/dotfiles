return {
  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        custom = {
          mode = "diagnostics",
          filter = { buf = 0 }, -- filter diagnostics to the current buffer
          preview = {
            type = "split",
            relative = "win",
            position = "right",
            size = 0.3,
          },
        },
      },
    },
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble custom toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
    },
  },
}
