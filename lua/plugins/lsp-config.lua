return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"jsonls",
				"pyright",
			},
			automatic_installation = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("lua.ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			vim.lsp.config("jsonls", {
				settings = {},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Navigation
					local tb = require("telescope.builtin")
					map("gd", tb.lsp_definitions, "Go to Definition")
					-- map('gd', vim.lsp.buf.definition, 'Go to Definition')
					map("gi", tb.lsp_implementations, "Go to Implementation")
					-- map('gi', vim.lsp.buf.implementation, 'Go to Implementation')
					map("gr", tb.lsp_references, "Go to References")
					-- map('gr', vim.lsp.buf.references, 'Go to References')
					map("gy", tb.lsp_type_definitions, "Go to Type Definition")
					-- map('gy', vim.lsp.buf.definition, 'Go to Type Definition')
					map("gD", vim.lsp.buf.declaration, "Go to Declaration")

					-- Docs / Info
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("gk", vim.lsp.buf.signature_help, "Signature Help")

					-- Actions
					map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
					map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, "Format buffer")
				end,
			})
		end,
	},
}
