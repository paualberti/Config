------------
-- Toggle --
------------

local function toggle_opt(opt)
	-- Check if the option exists
	if vim.fn.exists("&" .. opt) ~= 1 then
		print("Error: '" .. opt .. "' is not a valid option.")
		return
	end

	local current_value = vim.o[opt]

	-- Check if the option is a boolean
	if type(current_value) == "boolean" then
		vim.o[opt] = not current_value
		print(opt .. " = " .. tostring(vim.o[opt])) -- Optional feedback
	else
		print("Error: '" .. opt .. "' is not a boolean option.")
	end
end

vim.api.nvim_create_user_command("ToggleOpt", function(opts)
	if opts.args ~= "" then
		toggle_opt(opts.args)
	else
		print("Usage: ToggleOpt <option>")
	end
end, { nargs = 1 })

local function toggle_diagnostics()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
	print("Diagnostics = " .. tostring(vim.diagnostic.is_enabled()))
end

-- Keymap to toggle diagnostics
vim.keymap.set("n", "\\d", toggle_diagnostics, { desc = "Toggle LSP Diagnostics" })
vim.keymap.set("n", "\\h", "<Cmd>ToggleOpt hlsearch<CR>", { desc = "HlSearch" })
vim.keymap.set("n", "\\l", "<Cmd>ToggleOpt list<CR>", { desc = "List" })
vim.keymap.set("n", "\\n", "<Cmd>ToggleOpt number<CR>", { desc = "Number" })
vim.keymap.set("n", "\\r", "<Cmd>ToggleOpt relativenumber<CR>", { desc = "Relativenumber" })
vim.keymap.set("n", "\\s", "<Cmd>ToggleOpt spell<CR>", { desc = "Spell" })
vim.keymap.set("n", "\\w", "<Cmd>ToggleOpt wrap<CR>", { desc = "Wrap" })
