return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"jay-babu/mason-nvim-dap.nvim",
			"thehamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			vim.keymap.set("n", "<leader>dc", dap.continue,                            { desc = "Debug: Continue" })
			vim.keymap.set("n", "<leader>ds", dap.step_over,                           { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<leader>di", dap.step_into,                           { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<leader>do", dap.step_out,                            { desc = "Debug: Step Out" })
			vim.keymap.set("n", "<leader>b",  dap.toggle_breakpoint,                   { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>B",  function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,                                                                        { desc = "Debug: Conditional Breakpoint" })
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "mason-org/mason.nvim", "mfussenegger/nvim-dap" },
		opts = {
			ensure_installed = { "python", "js-debug-adapter" },
			automatic_installation = true,
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap",
		ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
		config = function()
			local dap = require("dap")
			local mason_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"

			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = { mason_path .. "/js-debug/src/dapDebugServer.js", "${port}" },
				},
			}

			for _, lang in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
				dap.configurations[lang] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
					},
				}
			end

			local function setup_js_keymaps()
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = true, desc = "Debug (JS): " .. desc })
				end
				map("<leader>dd", dap.continue,  "Start / Continue")
				map("<leader>dx", dap.terminate, "Terminate")
			end

			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
				callback = setup_js_keymaps,
			})

			local ft = vim.bo.filetype
			if vim.tbl_contains({ "javascript", "typescript", "javascriptreact", "typescriptreact" }, ft) then
				setup_js_keymaps()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		dependencies = { "mfussenegger/nvim-dap" },
		ft = "python",
		config = function()
			require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")

			local function setup_python_keymaps()
				local map = function(mode, keys, func, desc)
					vim.keymap.set(mode, keys, func, { buffer = true, desc = "Debug (Py): " .. desc })
				end
				local dap = require("dap")
				local dappy = require("dap-python")

				map("n", "<leader>dd", dap.continue,          "Start / Continue")
				map("n", "<leader>dt", dappy.test_method,     "Test Method")
				map("n", "<leader>dT", dappy.test_class,      "Test Class")
				map("v", "<leader>dv", dappy.debug_selection, "Debug Selection")
				map("n", "<leader>dx", dap.terminate,         "Terminate")
			end

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "python",
				callback = setup_python_keymaps,
			})

			if vim.bo.filetype == "python" then
				setup_python_keymaps()
			end
		end,
	},
}
