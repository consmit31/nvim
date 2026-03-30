return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.completion.spell,
				-- require("none-ls.diagnostics.eslint"),
			},
		})
        
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
        vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, {})
        vim.keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help, {})
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
        vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

	end,
}
