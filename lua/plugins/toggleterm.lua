return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {},
    config = function()
        require("toggleterm").setup({
            open_mapping = [[<c-\>]],
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
        local Terminal  = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({
            cmd = "lazygit",
            display_name = "lazygit",
            direction = "float",
            dir = ".",
            close_on_exit = true,
        })

        function _lazygit_toggle()
            lazygit:toggle()
        end

        vim.api.nvim_set_keymap("n", "<C-g>", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
    end
}
