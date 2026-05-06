return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				swift = { "swiftformat" },
				python = { "ruff_format" },
			},
			format_on_save = function(bufnr)
				local ft = vim.bo[bufnr].filetype
				if ft ~= "swift" and ft ~= "python" then
					return
				end
				return { timeout_ms = 1000, lsp_fallback = false }
			end,
		})
	end,
}
