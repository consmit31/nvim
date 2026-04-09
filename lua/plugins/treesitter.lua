return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = { "lua", "elixir" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
