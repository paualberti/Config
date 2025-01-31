return {
    "brianhuster/live-preview.nvim",
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
