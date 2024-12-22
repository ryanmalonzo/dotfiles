return {
  {
    "echasnovski/mini.nvim",
    enabled = true,
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.ai").setup()
      require("mini.pairs").setup()
      require("mini.statusline").setup()
      require("mini.surround").setup {
        mappings = {
          add = "za", -- Add surrounding in Normal and Visual modes
          delete = "zd", -- Delete surrounding
          highlight = "zh", -- Highlight surrounding
          replace = "zr", -- Replace surrounding
        },
      }
    end,
  },
}
