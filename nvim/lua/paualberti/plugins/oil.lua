return {
    'stevearc/oil.nvim',
    opts = {
        keymaps = {
            ["q"] = { "actions.close", mode = "n" }
        },
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent dir with Oil" })
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
