return {
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    opts = {
      -- add your options that should be passed to the setup() function here
      position = "right",
    },
  },
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      return {
        lua = {
          on_attach = function(_, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
              end,
            })
          end,
          capabilities = capabilities,
        },
        tsserver = {
          on_attach = function(_, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
              end,
            })
          end,
          capabilities = capabilities,
          filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
        },
      }
    end,
    config = function(_, opts)
      require("lspconfig").lua_ls.setup(opts.lua)
      require("lspconfig").tsserver.setup(opts.tsserver)
      for name, icon in pairs(require("lazyvim.config").icons.diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
    end,
  },
  {
    "anott03/nvim-lspinstall"
  },

}
