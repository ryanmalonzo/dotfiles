return {
  {
    "stevearc/conform.nvim",
    enabled = true,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>fb",
        function() require("conform").format { async = true } end,
        mode = "",
        desc = "Format buffer",
      },
    },
    config = function()
      require("conform").setup {
        formatters = {
          isort = {
            preprend_args = { "--profile", "black" },
          },
        },

        formatters_by_ft = {
          javascript = { "prettierd" },
          javascriptreact = { "deno_fmt" },
          lua = { "stylua" },
          markdown = { "prettierd" },
          python = { "isort", "black" },
          typescript = { "deno_fmt" },
          typescriptreact = { "deno_fmt" },
        },

        format_on_save = function(bufnr)
          -- Disable with a global or buffer-local variable
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
          return { timeout_ms = 2500, lsp_format = "fallback" }
        end,
      }

      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })
      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = "Re-enable autoformat-on-save",
      })
    end,
  },
}
