return {
  {
    "echasnovski/mini.nvim",
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
          find = "", -- Find surrounding (to the right)
          find_left = "", -- Find surrounding (to the left)
          highlight = "", -- Highlight surrounding
          replace = "zr", -- Replace surrounding
          update_n_lines = "", -- Update `n_lines`
          suffix_last = "l", -- Suffix to search with "prev" method
          suffix_next = "n", -- Suffix to search with "next" method
        },
      }
    end,
  },
}
