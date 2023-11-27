-- Fterm
vim.api.nvim_set_keymap("n", ";tt", ":lua require('FTerm').toggle()<CR>", {noremap=true})
vim.api.nvim_set_keymap("t", "<leader>tt", '<C-\\><C-n>:lua require("FTerm").toggle()<CR>', {noremap=true})

