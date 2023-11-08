return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local nvimtree = require("nvim-tree")

    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable hightlight groups
    vim.opt.termguicolors = true

    -- change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default key mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom key mappings
      local keymap = vim.keymap

      keymap.set("n", "n", api.fs.create, opts("create new node"))
    end

    nvimtree.setup({
      on_attach = my_on_attach,
      view = {
        width = 35,
        relativenumber = true
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
            }
          }
        }
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false
          },
          quit_on_open = true
        }
      },
      filters = {
        custom = { ".DS_Store" }
      },
      git = {
        ignore = false
      }
    })

    local keymap = vim.keymap

    keymap.set("n", ";e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvim tree explorer" })
    keymap.set("n", ";f", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle and find file nvim tree explorer" })
    keymap.set("n", ";c", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse nvim tree explorer" })
    keymap.set("n", ";r", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh nvim tree explorer" })
  end
}
