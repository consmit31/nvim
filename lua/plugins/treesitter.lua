return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.config")
        config.setup({
            ensure_installed = { "lua" },
            highlight = { enabled = true },
            indent = { enabled = true },
        })
    end
}
