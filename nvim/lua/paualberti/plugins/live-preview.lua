return {
    "brianhuster/live-preview.nvim",
    branch = "0.8.x",
    dependencies = {
        -- You can choose one of the following pickers
        "nvim-telescope/telescope.nvim",
        "ibhagwan/fzf-lua",
        -- "echasnovski/mini.pick",
    },
    opts = {},
    keys = {
        { "<leader>l", "<CMD>LivePreview start<CR>", desc = "[L]ive preview" }
    }
}
