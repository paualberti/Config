return {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() -- Harpoon setup
        local mark = require("harpoon.mark")
        local ui   = require("harpoon.ui")

        -- Keymaps for Harpoon
        vim.keymap.set("n", "<leader>ha", mark.add_file,        { desc = "[A]dd file" }) -- Add file to Harpoon
        vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu, { desc = "Quick [M]enu" }) -- Toggle Harpoon quick menu
        vim.keymap.set("n", "<tab>",      ui.nav_next)
        vim.keymap.set("n", "<s-tab>",    ui.nav_prev)
    end,
}
