return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
    { 'RRethy/nvim-treesitter-endwise' },
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      modules = {},
      sync_install = false,
      ignore_install = {},
      auto_install = true,
      highlight = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
      endwise = {enabled = true},
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "gitignore",
        "haskell",
        "html",
        "htmldjango",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "ruby",
        "markdown",
        "markdown_inline",
        "python",
        "scss",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
