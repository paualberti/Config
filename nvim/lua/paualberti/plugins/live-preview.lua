return {
    "brianhuster/live-preview.nvim",
    version = "*",
    dependencies = {
        -- You can choose one of the following pickers
        -- "nvim-telescope/telescope.nvim",
        -- "ibhagwan/fzf-lua",
        "echasnovski/mini.pick",
    },
    opts = {},
    keys = {
        { "<leader>l", "<cmd>LivePreview start<cr>", desc = "[L]ive preview" }
    }
}
