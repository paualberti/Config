-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

-- return {}
return {
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
			{ "echasnovski/mini.fuzzy", version = "*", opts = {}, event = "BufEnter" },
		},
		config = function()
			-- Telescope is a fuzzy finder that comes with a lot of different things that
			-- it can fuzzy find! It's more than just a "file finder", it can search
			-- many different aspects of Neovim, your workspace, LSP, and more!
			--
			-- The easiest way to use Telescope, is to start by doing something like:
			--  :Telescope help_tags
			--
			-- After running this command, a window will open up and you're able to
			-- type in the prompt window. You'll see a list of `help_tags` options and
			-- a corresponding preview of the help.
			--
			-- Two important keymaps to use while in Telescope are:
			--  - Insert mode: <c-/>
			--  - Normal mode: ?
			--
			-- This opens a window that shows you all of the keymaps for the current
			-- Telescope picker. This is really useful to discover what Telescope can
			-- do as well as how to actually do it!

			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			local theme = require("telescope.themes").get_dropdown({ previewer = true })
			require("telescope").setup({
				-- You can put your default mappings / updates / etc. in here
				--  All the info you're looking for is in `:help telescope.setup()`
				--
				-- defaults = {
				--   mappings = {
				--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
				--   },
				-- },
				-- pickers = {}
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(theme),
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- See `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			-- stylua: ignore start
			vim.keymap.set("n", Leader .. "/", function() builtin.current_buffer_fuzzy_find(theme) end, { desc = "Grep current buffer" })
			vim.keymap.set("n", Leader .. "fb", function() builtin.buffers(theme) end, { desc = "Open Buffers" })
			vim.keymap.set("n", Leader .. "fd", function() builtin.diagnostics(theme) end, { desc = "Diagnostics" })
			vim.keymap.set("n", Leader .. "ff", function() builtin.find_files(theme) end, { desc = "Files" })
			vim.keymap.set("n", Leader .. "fg", function() builtin.live_grep(theme) end, { desc = "by Grep" })
			vim.keymap.set("n", Leader .. "ft", function() builtin.help_tags(theme) end, { desc = "Help Tags" })
			vim.keymap.set("n", Leader .. "fk", function() builtin.keymaps(theme) end, { desc = "Keymaps" })
			vim.keymap.set("n", Leader .. "fo", function() builtin.oldfiles(theme) end, { desc = "Old Files" })
			vim.keymap.set("n", Leader .. "fr", function() builtin.resume(theme) end, { desc = "Resume" })
			vim.keymap.set("n", Leader .. "fs", function() builtin.builtin(theme) end, { desc = "Select command" })
			vim.keymap.set("n", Leader .. "fw", function() builtin.grep_string(theme) end, { desc = "Current Word" })
			-- stylua: ignore end

			-- Slightly advanced example of overriding default behavior and theme
			-- vim.keymap.set("n", Leader .. "/", function()
			-- 	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			-- 	builtin.current_buffer_fuzzy_find(theme)
			-- end, { desc = "[/] Fuzzily search in current buffer" })

			-- It's also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", Leader .. "f/", function()
				builtin.live_grep(vim.tbl_extend("force", theme, {
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				}))
			end, { desc = "by Grep in Open Files" })

			-- Shortcut for searching your Neovim configuration files
			vim.keymap.set("n", Leader .. "fc", function()
				builtin.find_files(vim.tbl_extend("force", theme, {
					cwd = vim.fn.stdpath("config"),
				}))
			end, { desc = "Neovim Config Files" })

			-- Custom path search
			vim.api.nvim_create_user_command("SearchFileCwd", function(opts)
				builtin.find_files(vim.tbl_extend("force", theme, { cwd = "$HOME/" .. opts.args }))
			end, { nargs = 1 })
			vim.keymap.set("n", Leader .. "sf", ":SearchFileCwd ", { desc = "Files" })

			vim.api.nvim_create_user_command("SearchGrepCwd", function(opts)
				builtin.live_grep(vim.tbl_extend("force", theme, { cwd = "$HOME/" .. opts.args }))
			end, { nargs = 1 })
			vim.keymap.set("n", Leader .. "sg", ":SearchGrepCwd ", { desc = "by Grep" })
		end,
	},
}
