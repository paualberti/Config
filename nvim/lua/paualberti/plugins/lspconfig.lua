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
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				lspconfig[server].setup(config)
			end

			vim.keymap.set(M.n, "gd", "<CMD>FzfLua lsp_definitions<CR>", { desc = "Definition" })
			vim.keymap.set(M.n, "gD", "<CMD>FzfLua lsp_declarations<CR>", { desc = "Declaration" })
			vim.keymap.set(M.n, "gR", "<CMD>FzfLua lsp_references<CR>", { desc = "References" })
			vim.keymap.set(M.n, "gI", "<CMD>FzfLua lsp_implementation<CR>", { desc = "Implementation" })

			vim.keymap.set(M.n, "<leader>ca", "<CMD>FzfLua lsp_code_actions<CR>", { desc = "Action" })
			vim.keymap.set(M.n, "<leader>cd", "<CMD>FzfLua lsp_typedefs<CR>", { desc = "Type Definition" })
			vim.keymap.set(M.n, "<leader>cl", "<CMD>Lazy<CR>", { desc = "Lazy" })
			vim.keymap.set(M.n, "<leader>cm", "<CMD>Mason<CR>", { desc = "Mason" })
			vim.keymap.set(M.n, "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
			vim.keymap.set(M.n, "<leader>cs", "<CMD>FzfLua lsp_document_symbols<CR>", { desc = "Document Symbols" })
			vim.keymap.set(M.n, "<leader>cw", "<CMD>FzfLua lsp_workspace_symbols<CR>", { desc = "Workspace Symbols" })
		end,
	},
}
