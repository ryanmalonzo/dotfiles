return {
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      "saghen/blink.cmp",
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local lspconfig = require "lspconfig"

      lspconfig["eslint"].setup { capabilities = capabilities }
      lspconfig["basedpyright"].setup { capabilities = capabilities }
      lspconfig["lua_ls"].setup { capabilities = capabilities }
      lspconfig["marksman"].setup { capabilities = capabilities }
    end,
  },
}
