function ColorMyPencils(color)
	color = color
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

return {
    {
	{
	    "ellisonleao/gruvbox.nvim",
	    priority = 1000,
	    config = function()
		require("gruvbox").setup({
		    terminal_colors = true,
		    transparent_mode = true,
		    italic = {
			strings = false,
			comments = false,
			keywords = false,
		    }
		})

		vim.cmd("colorscheme gruvbox")
		ColorMyPencils("gruvbox")
	    end
	},
    },
}
