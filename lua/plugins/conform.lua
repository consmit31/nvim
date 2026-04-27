return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				swift = { "swiftformat" },
			},
			format_on_save = function(bufnr)
				if vim.bo[bufnr].filetype ~= "swift" then
					return
				end
				return { timeout_ms = 1000, lsp_fallback = false }
			end,
		})
	end,
}
