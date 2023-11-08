return {
  "danymat/neogen",
  dependecies = { "nvim-treesitter/nvim-treesitter" },
  config = function ()
    local neogen = require("neogen")
    local keymap = vim.keymap

    neogen.setup({
      snippet_engine = "luasnip"
    })

    keymap.set("n", "<leader>nf", ":lua require('neogen').generate({ type = 'func' })")
  end
}
