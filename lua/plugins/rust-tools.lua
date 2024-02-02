return {
  "simrat39/rust-tools.nvim",
  lazy = true,
  ft = "rust",
  opts = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local ok, mason_registry = pcall(require, "mason-registry")
    local adapter ---@type any
    if ok then
      -- rust tools configuration for debugging support
      local codelldb = mason_registry.get_package("codelldb")
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = ""
      if vim.loop.os_uname().sysname:find("Windows") then
        liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
      elseif vim.fn.has("mac") == 1 then
        liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
      else
        liblldb_path = extension_path .. "lldb/lib/liblldb.so"
      end
      adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
    end
    return {
      dap = {
        adapter = adapter,
      },
      rust = {
        tools = {
          inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = "<-",
            other_hints_prefix = "=>",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",
          },
          autoSetHints = true,
          runnables = {
            use_telescope = true,
          },
          on_initialized = function()
            vim.cmd([[
              augroup RustLSP
                autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
              augroup END
            ]])
          end,
        },
        server = {
          keys = {
            { "K",          "<cmd>RustHoverActions<cr>", desc = "Hover Actions (Rust)" },
            { "<leader>cR", "<cmd>RustCodeAction<cr>",   desc = "Code Action (Rust)" },
            { "<leader>dr", "<cmd>RustDebuggables<cr>",  desc = "Run Debuggables (Rust)" },
          },
          on_attach = function(_, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
              end,
            })
          end,
          capabilities = capabilities,
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                autoreload = true,
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
                buildScripts = {
                  enable = true,
                },
              },
              diagnostics = {
                disabled = { "unresolved-proc-macro" },
                enableExperimental = true,
                enable = true,
                warnings = true,
                macroWarnings = true,
                unstableFeatures = true,
                enableFor = { "clippy" },
              },
              completion = {
                addCallArgumentSnippets = true,
                addCallParenthesis = true,
                postfix = {
                  enable = true,
                },
              },
              -- Add clippy lints for Rust.
              checkOnSave = {
                allFeatures = true,
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
              procMacro = {
                enable = true,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                },
              },
            },
          },
        },
        taplo = {
          keys = {
            {
              "K",
              function()
                if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                  require("crates").show_popup()
                else
                  vim.lsp.buf.hover()
                end
              end,
              desc = "Show Crate Documentation",
            },
          },
        },
      },
      setup = {
        rust_analyzer = function(_, opts)
          local rust_tools_opts = require("lazyvim.util").opts("rust-tools.nvim")
          require("rust-tools").setup(vim.tbl_deep_extend("force", rust_tools_opts or {}, { server = opts }))
          return true
        end,
      },
    }
  end,
  config = function(_, opts)
    require("rust-tools").setup(opts)
  end,
}
