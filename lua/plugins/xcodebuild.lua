return {
	"wojciech-kulik/xcodebuild.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("xcodebuild").setup({
			logs = {
				auto_open_on_success_build = false,
				auto_open_on_failed_build = true,
				auto_open_on_success_tests = false,
				auto_open_on_failed_tests = true,
				auto_close_on_app_launch = true,
				only_summary = true,
			},
			code_coverage = { enabled = true },
		})

		local x = "<cmd>Xcodebuild"
		vim.keymap.set("n", "<leader>X", x .. "Picker<cr>", { desc = "Xcode: Actions" })
		vim.keymap.set("n", "<leader>xf", x .. "ProjectManager<cr>", { desc = "Xcode: Project Manager" })
		vim.keymap.set("n", "<leader>xb", x .. "Build<cr>", { desc = "Xcode: Build" })
		vim.keymap.set("n", "<leader>xB", x .. "BuildForTesting<cr>", { desc = "Xcode: Build for Testing" })
		vim.keymap.set("n", "<leader>xr", x .. "BuildRun<cr>", { desc = "Xcode: Build & Run" })
		vim.keymap.set("n", "<leader>xt", x .. "Test<cr>", { desc = "Xcode: Run Tests" })
		vim.keymap.set("v", "<leader>xt", x .. "TestSelected<cr>", { desc = "Xcode: Run Selected Tests" })
		vim.keymap.set("n", "<leader>xT", x .. "TestClass<cr>", { desc = "Xcode: Run Test Class" })
		vim.keymap.set("n", "<leader>xl", x .. "ToggleLogs<cr>", { desc = "Xcode: Toggle Logs" })
		vim.keymap.set("n", "<leader>xc", x .. "ToggleCodeCoverage<cr>", { desc = "Xcode: Toggle Coverage" })
		vim.keymap.set("n", "<leader>xC", x .. "ShowCodeCoverageReport<cr>", { desc = "Xcode: Coverage Report" })
		vim.keymap.set("n", "<leader>xE", x .. "TestExplorerToggle<cr>", { desc = "Xcode: Test Explorer" })
		vim.keymap.set("n", "<leader>xs", x .. "FailingSnapshots<cr>", { desc = "Xcode: Failing Snapshots" })
		vim.keymap.set("n", "<leader>xd", x .. "SelectDevice<cr>", { desc = "Xcode: Select Device" })
		vim.keymap.set("n", "<leader>xp", x .. "SelectTestPlan<cr>", { desc = "Xcode: Select Test Plan" })
		vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Xcode: QuickFix List" })
		vim.keymap.set("n", "<leader>xx", x .. "QuickfixLine<cr>", { desc = "Xcode: Quickfix Line" })
		vim.keymap.set("n", "<leader>xa", x .. "CodeActions<cr>", { desc = "Xcode: Code Actions" })
	end,
}
