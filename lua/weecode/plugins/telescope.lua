return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          n = {
            ["q"] = actions.close
          },
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          }
        }
      }
    })

    telescope.load_extension("fzf")

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    keymap.set("n", "ff", "<cmd>Telescope find_files<CR>", opts)
    keymap.set("n", "fr", "<cmd>Telescope oldfiles<CR>", opts) -- fuzzy find recent files
    keymap.set("n", "ft", "<cmd>Telescope live_grep<CR>", opts) -- find text in files
    -- keymap.set('n', 'sf',
    --   '<cmd> lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode = "normal", layout_config = { height = 40 } })<cr>'
    --   ,
    -- opts)
  end
}
