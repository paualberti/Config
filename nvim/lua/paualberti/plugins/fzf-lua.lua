return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"echasnovski/mini.icons",
		"nvim-treesitter/nvim-treesitter-context",
	},
	opts = {
		"hide",

		winopts = {
			-- split = "belowright new",-- open in a split instead?
			-- "belowright new"  : split below
			-- "aboveleft new"   : split above
			-- "belowright vnew" : split right
			-- "aboveleft vnew   : split left
			-- Only valid when using a float window
			-- (i.e. when 'split' is not defined, default)
			height = 0.85, -- window height
			width = 0.80, -- window width
			row = 0.35, -- window row position (0=top, 1=bottom)
			col = 0.50, -- window col position (0=left, 1=right)
			-- border argument passthrough to nvim_open_win()
			border = "rounded",
			-- Backdrop opacity, 0 is fully opaque, 100 is fully transparent (i.e. disabled)
			backdrop = 99,
			-- title         = "Title",
			-- title_pos     = "center",        -- 'left', 'center' or 'right'
			-- title_flags   = false,           -- uncomment to disable title flags
			fullscreen = false, -- start fullscreen?
			-- enable treesitter highlighting for the main fzf window will only have
			-- effect where grep like results are present, i.e. "file:line:col:text"
			-- due to highlight color collisions will also override `fzf_colors`
			-- set `fzf_colors=false` or `fzf_colors.hl=...` to override
			treesitter = {
				enabled = true,
				fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" },
			},
			preview = {
				default = "default", -- override the default previewer?
				-- default uses the 'builtin' previewer
				border = "rounded", -- preview border: accepts both `nvim_open_win`
				-- and fzf values (e.g. "border-top", "none")
				-- native fzf previewers (bat/cat/git/etc)
				-- can also be set to `fun(winopts, metadata)`
				wrap = false, -- preview line wrap (fzf's 'wrap|nowrap')
				hidden = false, -- start preview hidden
				vertical = "down:45%", -- up|down:size
				horizontal = "right:60%", -- right|left:size
				layout = "flex", -- horizontal|vertical|flex
				flip_columns = 100, -- #cols to switch to horizontal on flex
				-- Only used with the builtin previewer:
				title = true, -- preview border title (file/buf)?
				title_pos = "center", -- left|center|right, title alignment
				scrollbar = "float", -- `false` or string:'float|border'
				-- float:  in-window floating border
				-- border: in-border "block" marker
				scrolloff = -1, -- float scrollbar offset from right
				-- applies only when scrollbar = 'float'
				delay = 20, -- delay(ms) displaying the preview
				-- prevents lag on fast scrolling
				winopts = { -- builtin previewer window options
					number = true,
					relativenumber = true,
					cursorline = true,
					cursorlineopt = "both",
					cursorcolumn = false,
					signcolumn = "no",
					list = false,
					foldenable = true,
					foldmethod = "indent",
				},
			},
			on_create = function()
				-- called once upon creation of the fzf main window
				-- can be used to add custom fzf-lua mappings, e.g:
				--   vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
			end,
			-- called once _after_ the fzf interface is closed
			-- on_close = function() ... end
		},
	},
	config = function()
		vim.keymap.set(M.n, "<leader>fb", "<CMD>FzfLua buffers<CR>", { desc = "Open Buffers" })
		vim.keymap.set(
			M.n,
			"<leader>fc",
			"<CMD>FzfLua files cwd=" .. vim.fn.stdpath("config") .. "<CR>",
			{ desc = "Open Buffers" }
		)
		vim.keymap.set(M.n, "<leader>fd", "<CMD>FzfLua diagnostics_workspace<CR>", { desc = "Diagnostics" })
		vim.keymap.set(M.n, "<leader>ff", "<CMD>FzfLua files<CR>", { desc = "Files" })
		vim.keymap.set(M.n, "<leader>fg", "<CMD>FzfLua live_grep_native<CR>", { desc = "by Grep" })
		vim.keymap.set(M.n, "<leader>fh", "<CMD>FzfLua helptags<CR>", { desc = "Help Tags" })
		vim.keymap.set(M.n, "<leader>fk", "<CMD>FzfLua keymaps<CR>", { desc = "Keymaps" })
		vim.keymap.set(M.n, "<leader>fo", "<CMD>FzfLua oldfiles<CR>", { desc = "Old Files" })
		vim.keymap.set(M.n, "<leader>fq", "<CMD>FzfLua quickfix<CR>", { desc = "QuickFix" })
		vim.keymap.set(M.n, "<leader>fr", "<CMD>FzfLua resume<CR>", { desc = "Resume" })
		vim.keymap.set(M.n, "<leader>fs", "<CMD>FzfLua builtin<CR>", { desc = "Select command" })
		vim.keymap.set(M.n_v, "<leader>/", "<CMD>FzfLua lgrep_curbuf<CR>", { desc = "Grep current buffer" })
	end,
}
