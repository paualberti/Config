return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        require("which-key").add({
            { "<leader>b", group = "Buffer" },
            { "<leader>h", group = "Harpoon" },
            { "<leader>l", group = "LivePreview" },
            { "<leader>s", group = "Search" },
            { "<leader>t", group = "Toggle" },
        })
    end,
}
