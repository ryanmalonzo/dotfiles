return {
  { lazy = true, "nvim-lua/plenary.nvim" },

  { lazy = true, "echasnovski/mini.icons", opts = {} },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = require "plugins.configs.catppuccin",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "plugins.configs.treesitter"
    end,
  },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall" },
    opts = {},
  },

  {
    "saghen/blink.cmp",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    opts = require "plugins.configs.blink",
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "plugins.configs.lspconfig"
    end,
  },

  {
    "zapling/mason-conform.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "stevearc/conform.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = require "plugins.configs.conform",
  },

  {
    "pmizio/typescript-tools.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = require "plugins.configs.typescript-tools",
  },

  {
    "stevearc/oil.nvim",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
      require "plugins.configs.oil"
    end,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "plugins.configs.harpoon"
    end,
  },

  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      require("mini.ai").setup()
      require("mini.pairs").setup()
      require("mini.statusline").setup()
    end,
  },

  {
    "folke/snacks.nvim",
    opts = require "plugins.configs.snacks",
    keys = {
      {
        "<leader>lg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>ff",
        function()
          Snacks.picker.files()
        end,
        desc = "Find Files",
      },
      {
        "<leader>fw",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = require "plugins.configs.gitsigns",
  },

  {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    event = { "BufReadPost" },
    opts = {},
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    config = function()
      require "plugins.configs.copilot"
    end,
  },
}
