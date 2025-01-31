return {
    "brianhuster/live-preview.nvim",
    lazy = true,
    dependencies = {
        -- You can choose one of the following pickers
        "nvim-telescope/telescope.nvim",
        "ibhagwan/fzf-lua",
        -- "echasnovski/mini.pick",
    },
    opts = {},
    keys = {
        { "<leader>ls", "<CMD>LivePreview start<CR>", desc = "[S]tart" },
        { "<leader>lc", "<CMD>LivePreview close<CR>", desc = "[C]lose" },
        { "<leader>lp", "<CMD>LivePreview pick<CR>", desc = "[P]ick" },
    }
}
