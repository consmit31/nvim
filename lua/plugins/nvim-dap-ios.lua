return {
	{
		"mfussenegger/nvim-dap",
		dependencies = { "wojciech-kulik/xcodebuild.nvim" },
		config = function()
			local xcodebuild = require("xcodebuild.integrations.dap")
			xcodebuild.setup()

			vim.keymap.set("n", "<leader>dd", xcodebuild.build_and_debug, { desc = "Debug: Build & Debug" })
			vim.keymap.set("n", "<leader>dr", xcodebuild.debug_without_build, { desc = "Debug: Run (no build)" })
			vim.keymap.set("n", "<leader>dt", xcodebuild.debug_tests, { desc = "Debug: Tests" })
			vim.keymap.set("n", "<leader>dT", xcodebuild.debug_class_tests, { desc = "Debug: Class Tests" })
			vim.keymap.set("n", "<leader>b", xcodebuild.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>B", xcodebuild.toggle_message_breakpoint, { desc = "Debug: Message Breakpoint" })
			vim.keymap.set("n", "<leader>dx", xcodebuild.terminate_session, { desc = "Debug: Terminate" })
		end,
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
}
