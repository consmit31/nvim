return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"wojciech-kulik/xcodebuild.nvim",
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"jay-babu/mason-nvim-dap.nvim",
			"thehamsta/nvim-dap-virtual-text",
		},
		config = function()
			local xcodebuild = require("xcodebuild.integrations.dap")
			xcodebuild.setup()

			local dap = require("dap")
			vim.keymap.set("n", "<leader>dd", xcodebuild.build_and_debug, { desc = "Debug: Build & Debug" })
			vim.keymap.set("n", "<leader>dr", xcodebuild.debug_without_build, { desc = "Debug: Run (no build)" })
			vim.keymap.set("n", "<leader>dt", xcodebuild.debug_tests, { desc = "Debug: Tests" })
			vim.keymap.set("n", "<leader>dT", xcodebuild.debug_class_tests, { desc = "Debug: Class Tests" })
			vim.keymap.set("n", "<leader>b", xcodebuild.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>B", xcodebuild.toggle_message_breakpoint, { desc = "Debug: Message Breakpoint" })
			vim.keymap.set("n", "<leader>dx", xcodebuild.terminate_session, { desc = "Debug: Terminate" })
			vim.keymap.set("n", "<leader>dc", dap.continue,   { desc = "Debug: Continue" })
			vim.keymap.set("n", "<leader>ds", dap.step_over,  { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<leader>di", dap.step_into,  { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<leader>do", dap.step_out,   { desc = "Debug: Step Out" })
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "mason-org/mason.nvim", "mfussenegger/nvim-dap" },
		opts = {
			ensure_installed = { "python" },
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
