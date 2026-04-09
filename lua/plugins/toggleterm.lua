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
    end
}
