-- Fterm
vim.api.nvim_set_keymap("n", ";tt", ":lua require('FTerm').toggle()<CR>", {noremap=true})
vim.api.nvim_set_keymap("t", "<leader>tt", '<C-\\><C-n>:lua require("FTerm").toggle()<CR>', {noremap=true})

-- Trouble
vim.keymap.set("n", ";xt", "<CMD>TodoTrouble<CR>", {noremap=true, silent=true})


-- Todo Comments
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords

vim.keymap.set("n", "]e", function()
  require("todo-comments").jump_next({keywords = { "ERROR", "WARNING", "BUG", "FIX" }})
end, { desc = "Next error/warning todo comment" })

