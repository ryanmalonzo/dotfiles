return {
  {
    "nvim-telescope/telescope.nvim",
    enabled = true,
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
    event = "VeryLazy",
    config = function()
      require("telescope").setup {
        pickers = {
          find_files = {
            theme = "ivy",
          },
          live_grep = {
            theme = "ivy",
          },
        },
      }

      local builtin = require "telescope.builtin"
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set(
        "n",
        "<leader>cf",
        function()
          builtin.find_files {
            cwd = vim.fn.stdpath "config",
          }
        end
      )
      vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope live grep" })
    end,
  },
}
