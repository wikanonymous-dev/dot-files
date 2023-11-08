return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = { "windwp/nvim-ts-autotag" },
  config = function ()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      highlight = {
        enable = true,
        disable = {}
      },
      indent = {
        enable = true,
        disable = {}
      },
      autotag = {
        enable = true
      },
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "scss",
        "markdown",
        "markdown_inline",
        "dockerfile",
        "gitignore",
        "vue",
        "lua"
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false
      }
    })
  end
}
