return {
  "laytan/tailwind-sorter.nvim",
    dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim'},
    build = "cd formatter && npm i && npm run build",
    config = function ()
      local tailwind_sorter = require("tailwind-sorter")
      tailwind_sorter.setup({
        on_save_enabled = true,
        on_save_pattern = { "*.vue", "*.html" },
        node_path = "node"
      })
    end,
}
