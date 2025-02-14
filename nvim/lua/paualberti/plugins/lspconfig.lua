-- LSP Plugins
return {
	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		-- Main LSP Configuration
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			-- "hrsh7th/cmp-nvim-lsp",
			"nvim-telescope/telescope.nvim",
			"ibhagwan/fzf-lua",
		},
		opts = {
			servers = {
				clangd = {},
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = { disable = { "missing-fields" } },
						},
					},
				},
			},
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local theme = require("telescope.themes").get_dropdown({ previewer = true })
					local builtin = require("telescope.builtin")

					local map = function(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", desc, { buffer = event.buf }))
					end

					map("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration" })
					map("n", "gI", function()
						builtin.lsp_implementations(theme)
					end, { desc = "Implementation" })
					map("n", "gd", function()
						builtin.lsp_definitions(theme)
					end, { desc = "Definition" })
					map("n", "gr", function()
						builtin.lsp_references(theme)
					end, { desc = "References" })

					map("n", Leader .. "ca", vim.lsp.buf.code_action, { desc = "Action" })
					map("n", Leader .. "cd", function()
						builtin.lsp_definitions(theme)
					end, { desc = "Type Definition" })
					map("n", Leader .. "cr", vim.lsp.buf.rename, { desc = "Rename" })
					map("n", Leader .. "cs", function()
						builtin.lsp_document_symbols(theme)
					end, { desc = "Document Symbols" })
					map("n", Leader .. "cw", function()
						builtin.lsp_workspace_symbols(theme)
					end, { desc = "Workspace Symbols" })
				end,
			})

			vim.keymap.set("n", Leader .. "cl", "<Cmd>Lazy<CR>", { desc = "Lazy" })
			vim.keymap.set("n", Leader .. "cm", "<Cmd>Mason<CR>", { desc = "Mason" })

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
			local ensure_installed = vim.tbl_keys(opts.servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
				"clang-format",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
			for server, config in pairs(opts.servers) do
				require("lspconfig")[server].setup(config)
			end
		end,
	},
}
