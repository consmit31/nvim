return {
	{ "mason-org/mason.nvim", opts = {} },
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = { "tree-sitter-cli", "ruff" },
			auto_update = true,
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { { "mason-org/mason.nvim", opts = {} }, "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = { "lua_ls", "ts_ls", "jsonls", "pyright" },
			automatic_installation = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("lua_ls", {
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

			vim.lsp.config("sourcekit", {
				filetypes = { "swift", "objc", "objcpp" },
				cmd = { vim.trim(vim.fn.system("xcrun -f sourcekit-lsp")) },
				root_dir = function(_, callback)
					local util = require("lspconfig.util")
					callback(
						util.root_pattern("buildServer.json", "Package.swift", "*.xcworkspace", "*.xcodeproj")(
							vim.fn.getcwd()
						) or util.find_git_ancestor(vim.fn.getcwd())
					)
				end,
			})
			vim.lsp.enable("sourcekit")

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Navigation
					local tb = require("telescope.builtin")
					map("gd", tb.lsp_definitions, "Go to Definition")
					map("gl", vim.diagnostic.open_float, "Open diagnostics float")
					map("gG", tb.diagnostics, "Open diagnostics")
					map("gi", tb.lsp_implementations, "Go to Implementation")
					map("gr", tb.lsp_references, "Go to References")
					map("gy", tb.lsp_type_definitions, "Go to Type Definition")
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
