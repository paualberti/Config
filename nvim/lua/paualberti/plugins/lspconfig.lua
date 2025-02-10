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
			"hrsh7th/cmp-nvim-lsp",
			-- "ibhagwan/fzf-lua",
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
				callback = function()
					local theme = require("telescope.themes").get_dropdown({ previewer = true })
					local builtin = require("telescope.builtin")

					vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Definition" })
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration" })
					vim.keymap.set("n", "gR", builtin.lsp_references, { desc = "References" })
					vim.keymap.set("n", "gI", builtin.lsp_implementations, { desc = "Implementation" })

					vim.keymap.set("n", Leader .. "ca", vim.lsp.buf.code_action, { desc = "Action" })
					vim.keymap.set("n", Leader .. "cd", builtin.lsp_definitions, { desc = "Type Definition" })
					vim.keymap.set("n", Leader .. "cr", vim.lsp.buf.rename, { desc = "Rename" })
					vim.keymap.set("n", Leader .. "cs", builtin.lsp_document_symbols, { desc = "Document Symbols" })
					vim.keymap.set("n", Leader .. "cw", builtin.lsp_workspace_symbols, { desc = "Workspace Symbols" })

					-- vim.keymap.set("n", "gd", "<Cmd>FzfLua lsp_definitions<CR>", { desc = "Definition" })
					-- vim.keymap.set("n", "gD", "<Cmd>FzfLua lsp_declarations<CR>", { desc = "Declaration" })
					-- vim.keymap.set("n", "gR", "<Cmd>FzfLua lsp_references<CR>", { desc = "References" })
					-- vim.keymap.set("n", "gI", "<Cmd>FzfLua lsp_implementations<CR>", { desc = "Implementation" })

					-- vim.keymap.set("n", Leader .. "ca", "<Cmd>FzfLua lsp_code_actions<CR>", { desc = "Action" })
					-- vim.keymap.set("n", Leader .. "cd", "<Cmd>FzfLua lsp_typedefs<CR>", { desc = "Type Definition" })
					-- vim.keymap.set("n", Leader .. "cr", vim.lsp.buf.rename, { desc = "Rename" })
					-- vim.keymap.set(
					-- 	"n",
					-- 	Leader .. "cs",
					-- 	"<Cmd>FzfLua lsp_document_symbols<CR>",
					-- 	{ desc = "Document Symbols" }
					-- )
					-- vim.keymap.set(
					-- 	"n",
					-- 	Leader .. "cw",
					-- 	"<Cmd>FzfLua lsp_workspace_symbols<CR>",
					-- 	{ desc = "Workspace Symbols" }
					-- )
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
