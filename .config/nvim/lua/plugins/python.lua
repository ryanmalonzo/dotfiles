return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters = {
        isort = {
          prepend_args = { "--profile", "black" },
        },
      },
      formatters_by_ft = {
        python = { "isort", "black" },
      },
    },
  },
}
