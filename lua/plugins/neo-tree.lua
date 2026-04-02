return {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        },
        config = function()
            vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>')
            vim.keymap.set('i', '<C-n>', '<Esc>:Neotree filesystem reveal left<CR>')
            vim.keymap.set('v', '<C-n>', '<Esc>:Neotree filesystem reveal left<CR>')

            vim.keymap.set('n', '<C-m>', '<Esc>:Neotree close<CR>')
        end
}
