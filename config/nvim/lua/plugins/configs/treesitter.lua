require("nvim-treesitter.configs").setup {
  ensure_installed = { "lua", "vim", "vimdoc", "typescript", "javascript", "python" },

  auto_install = true,

  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },

  indent = { enable = true },
}
