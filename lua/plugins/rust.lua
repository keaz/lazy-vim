return {
    recommended = function()
      return LazyVim.extras.wants({
        ft = "rust",
        root = { "Cargo.toml", "rust-project.json" },
      })
    end,
  
    -- Extend auto completion
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        {
          "Saecki/crates.nvim",
          event = { "BufRead Cargo.toml" },
          opts = {
            completion = {
              cmp = { enabled = true },
            },
          },
        },
      },
      ---@param opts cmp.ConfigSchema
      opts = function(_, opts)
        opts.sources = opts.sources or {}
        table.insert(opts.sources, { name = "crates" })
      end,
    },
  
    -- Add Rust & related to treesitter
    {
      "nvim-treesitter/nvim-treesitter",
      opts = { ensure_installed = { "rust", "ron" } },
    },
  
    -- Ensure Rust debugger is installed
    {
      "williamboman/mason.nvim",
      optional = true,
      opts = { ensure_installed = { "codelldb" } },
    },
   
    -- Correctly setup lspconfig for Rust 🚀
    {
		'neovim/nvim-lspconfig',
		opts = {
			inlay_hints = {
				enabled = false,
			},
			diagnostics = { virtual_text = { prefix = "icons" } },
			capabilities = {
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					},
					completion = {
						completionItem = {
							snippetSupport = true,
						},
					},
				},
			},
			showMessage = {
				messageActionItem = {
					additionalPropertiesSupport = true,
				},
			},
			flags = {
				debounce_text_changes = 150,
			},
			servers = {
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							procMacro = { enable = true },
							cargo = { allFeatures = true },
							checkOnSave = {
								command = "clippy",
								extraArgs = { "--no-deps" },
							},
						},
					},
				},
				gopls = {
					settings = {
						gopls = {
							gofumpt = true,
							codelenses = {
								gc_details = false,
								generate = true,
								regenerate_cgo = true,
								run_govulncheck = true,
								test = true,
								tidy = true,
								upgrade_dependency = true,
								vendor = true,
							},
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
							analyses = {
								fieldalignment = true,
								nilness = true,
								unusedparams = true,
								unusedwrite = true,
								useany = true,
							},
							usePlaceholders = true,
							completeUnimported = true,
							staticcheck = true,
							directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules", "-.nvim" },
							semanticTokens = true,
						},
					},
				}
			},
		},
	},
  
    {
      "nvim-neotest/neotest",
      optional = true,
      opts = {
        adapters = {
          ["rustaceanvim.neotest"] = {},
        },
      },
    },
  },

  {
    "nvim-neotest/neotest",
    optional = true,
    opts = {
      adapters = {
        ["rustaceanvim.neotest"] = {},
      },
    },
  },
}

