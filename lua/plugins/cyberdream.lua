return {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("cyberdream").setup {
                transparent = true,
                styles = {
                    comments = "italic",
                    functions = "bold",
                    keywords = "bold,italic",
                    variables = "NONE",
                },
            }

            vim.cmd.colorscheme "cyberdream"
        end
    }
