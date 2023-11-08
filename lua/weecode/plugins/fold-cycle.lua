return {
  "jghauser/fold-cycle.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function ()
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true}

    keymap.set("n", "fdo", "require('fold-cycle').open()", opts)
    keymap.set("n", "fdc", "require('fold-cycle').close()", opts)
    keymap.set("n", "zc", "require('fold-cycle').close_all()", opts)
  end
}
