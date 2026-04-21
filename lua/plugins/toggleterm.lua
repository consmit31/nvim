return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {},
    config = function()
        require("toggleterm").setup({
            open_mapping = [[<c-\>]],
            start_in_insert = true,
            on_open = function(_)
                vim.cmd("startinsert!")
            end,
        	direction = 'float',
        	float_opts = {
        		border = 'curved',
        		winblend = 0,
                shading_factor = 15,
        		highlights = {
        			border = "Normal",
        			background = "Normal",
        		}
        	}
        })

        -- Open lazygit in a floating terminal with ctrl-g
        -- Terminal should close when lazygit exits
        local TerminalGit  = require('toggleterm.terminal').Terminal
        local lazygit = TerminalGit:new({
            cmd = "lazygit",
            display_name = "lazygit",
            direction = "float",
            dir = ".",
            close_on_exit = true,
        })

        function _lazygit_toggle()
            lazygit:toggle()
        end

        -- Open lazydocker in a floating terminal with ctrl-g
        -- Terminal should close when lazygit exits
        local TerminalDocker  = require('toggleterm.terminal').Terminal
        local lazydocker = TerminalDocker:new({
            cmd = "lazydocker",
            display_name = "lazydocker",
            direction = "float",
            dir = ".",
            close_on_exit = true,
        })

        function _lazydocker_toggle()
            lazydocker:toggle()
        end

        vim.api.nvim_create_autocmd("WinEnter", {
            pattern = "term://*",
            callback = function() vim.cmd("startinsert!") end,
        })

        vim.api.nvim_set_keymap("n", "<C-g>", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<C-d>", "<cmd>lua _lazydocker_toggle()<CR>", { noremap = true, silent = true })
    end
}
