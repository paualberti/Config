vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2

local term_command = "TermCommand"
vim.keymap.set("n", Leader .. "te", ":" .. term_command .. " ./e^I", { desc = "Execute executable" }) -- Execute project
