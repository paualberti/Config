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
			"hrsh7th/cmp-nvim-lsp",
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
			local theme = require("telescope.themes").get_ivy({
				theme = "dropdown",
				results_title = false,
				sorting_strategy = "ascending",
				layout_strategy = "bottom_pane",
				layout_config = {
					preview_cutoff = 1, -- Preview should always show (unless previewer = false)
					width = function(_, max_columns, _)
						return math.min(max_columns, 80)
					end,
					height = function(_, _, max_lines)
						return math.min(max_lines, 15)
					end,
				},
				border = true,
				borderchars = {
					prompt = { { desc = "─" }, "│", " ", "│", "╭", "╮", "│", "│" },
					results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
					preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				},
			})
			local builtin = require("telescope.builtin")

			vim.keymap.set(M.n, "gd", builtin.lsp_definitions, { desc = "Definition" })
			vim.keymap.set(M.n, "gD", vim.lsp.buf.declaration, { desc = "Declaration" })
			vim.keymap.set(M.n, "gR", function()
				builtin.lsp_references(theme)
			end, { desc = "References" })
			vim.keymap.set(M.n, "gI", function()
				builtin.lsp_implementations(theme)
			end, { desc = "Implementation" })

			vim.keymap.set(M.n, "<leader>cd", function()
				builtin.lsp_type_definitions(theme)
			end, { desc = "Definition" })
			vim.keymap.set(M.n, "<leader>cs", function()
				builtin.lsp_document_symbols(theme)
			end, { desc = "Document Symbols" })
			vim.keymap.set(M.n, "<leader>cw", function()
				builtin.lsp_dynamic_workspace_symbols(theme)
			end, { desc = "Workspace Symbols" })
			vim.keymap.set(M.n, "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
			vim.keymap.set(M.n, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

			local lspconfig = require("lspconfig")
			for k, v in pairs(opts.servers) do
				lspconfig[k].setup(v)
			end
		end,
	},
}
