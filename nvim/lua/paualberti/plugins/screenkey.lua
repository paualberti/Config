return {
    "NStefan002/screenkey.nvim",
    version = "*", -- or branch = "dev", to use the latest commit
    config = function()
        require("screenkey").setup({
            win_opts = {
                anchor = "NE",
            },
            group_mappings = true,
        })
    end,
    opts = {
        win_opts = {
            anchor = "NE",
        },
        group_mappings = true,
        vim.keymap.set("n", "<leader>ts", "<cmd>Screenkey toggle<cr>", { desc = "[S]creenkey" })
    }
}
