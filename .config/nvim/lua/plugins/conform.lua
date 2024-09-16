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
      format_on_save = {
        timeout_ms = 2500,
      },
    },
  },
}
