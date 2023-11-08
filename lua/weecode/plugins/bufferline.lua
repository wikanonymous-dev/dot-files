return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
    vim.opt.termguicolors = true

    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        mode = "tabs",
        separator_style = "slant",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true
          }
        }
      },
      highlights = {
        -- separator
        separator = {
          fg = "#494d64",
          bg = "NONE"
        },
        separator_selected = {
          fg = "#494d64",
          bg = "NONE"
        },
        -- tabs
        tab = {
          fg = "#494d64",
          bg = "NONE"
        },
        tab_selected = {
          fg = "#89dceb",
          bg = "NONE",
          bold = true
        },
        tab_separator = {
          fg = "#494d64",
          bg = "NONE"
        },
        tab_separator_selected = {
          fg = "#494d64",
          bg = "NONE"
        }
      }
    })

    vim.api.nvim_set_keymap("n", "tl", "<cmd>BufferLineCycleNext<CR>", {})
    vim.api.nvim_set_keymap("n", "th", "<cmd>BufferLineCyclePrev<CR>", {})
  end
}
