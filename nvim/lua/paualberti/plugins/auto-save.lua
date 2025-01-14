return {
	"brianhuster/autosave.nvim",
	lazy = false,
	event = "InsertEnter",
	opts = {}, -- Configuration here
  config = function ()
    vim.cmd("Autosave off")
  end,
	vim.keymap.set("n", "<leader>ta",	"<cmd>Autosave toggle<cr>", { desc = "[T]oggle [A]utosave" }),
}
