return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function ()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    local my_on_attach = function (client, bufnr)
      opts.buffer = bufnr

      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition and references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Go to definition"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- go to definition

      opts.desc = "Show LSP implementation"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementation

      opts.desc = "Show LSP type definition"
      keymap.set("n", "gi", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definition

      opts.desc = "See available code action"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = my_on_attach
    })

    lspconfig["tsserver"].setup({
      capabilities = capabilities,
      on_attach = my_on_attach
    })

    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = my_on_attach
    })

    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = my_on_attach,
    })

    lspconfig["vuels"].setup({
      capabilities = capabilities,
      on_attach = my_on_attach,
    })

    local util = require 'lspconfig.util'
    local function get_typescript_server_path(root_dir)

      local global_ts = '/home/[yourusernamehere]/.npm/lib/node_modules/typescript/lib'
      -- Alternative location if installed as root:
      -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
      local found_ts = ''
      local function check_dir(path)
        found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
        if util.path.exists(found_ts) then
          return path
        end
      end
      if util.search_ancestors(root_dir, check_dir) then
        return found_ts
      else
        return global_ts
      end
    end

    lspconfig["volar"].setup({
      capabilities = capabilities,
      on_attach = my_on_attach,
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
      on_new_config = function(new_config, new_root_dir)
        new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
      end,
    })

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = my_on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    lspconfig["eslint"].setup({
      on_attach = function (client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll"
        })
      end,
      settings = {
        run = "onSave"
      },
    })

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true
      }
    )
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers["hover"], { focusable = false }
    )

    vim.diagnostic.config({
      virtual_text = {
        prefix = "●"
      },
      update_in_insert = true,
      float = {
        source = "always"
      }
    })
  end
}
