return {
  "Sang-it/fluoride",
  config = function()
    require("fluoride").setup({
        window = {
            winblend = 0,
        }
    })

    vim.keymap.set("n", "<leader>cp", "<cmd>Fluoride<cr>", { desc = "Fluoride" })
  end,
}
