return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        flavour = "mocha",

        color_overrides = {
          mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          },
        },

        transparent_background = true,

        integrations = {
          blink_cmp = true,
          leap = true,
          lsp_trouble = true,
          snacks = true,
          which_key = true,
        },
      }

      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
