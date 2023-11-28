return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    keymap.set("n", ";xx", "<CMD>TroubleToggle<CR>", opts)
    keymap.set("n", ";xw", "<CMD>TroubleToggle workspace_diagnostics<CR>", opts)
    keymap.set("n", ";xd", "<CMD>TroubleToggle document_diagnostics<CR>")
    keymap.set("n", ";xl", "<CMD>TroubleToggle loclist<CR>")
    keymap.set("n", ";xq", "<CMD>TroubleToggle quickfix<CR>")
  end
}
