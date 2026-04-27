return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = { swift = { "swiftlint" } }
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			callback = function()
				if vim.bo.filetype == "swift" then
					lint.try_lint()
				end
			end,
		})
	end,
}
