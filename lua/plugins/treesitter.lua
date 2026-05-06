return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = { "lua", "elixir", "swift", "python" },
            auto_install = true,
        })
    end
}
