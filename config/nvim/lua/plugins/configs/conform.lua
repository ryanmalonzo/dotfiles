return {
  formatters = {
    isort = {
      preprend_args = { "--profile", "black" },
    },
  },

  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    markdown = { "prettierd" },
    python = { "isort", "black" },
    html = { "prettierd" },
    css = { "prettierd" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}
