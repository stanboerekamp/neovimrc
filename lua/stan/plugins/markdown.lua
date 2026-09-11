return {
	"MeanderingProgrammer/render-markdown.nvim",

	-- Only load the plugin when a Markdown file is opened.
	ft = { "markdown" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },

	-- Windows otherwise makes latex2text use a legacy console encoding that
	-- cannot output symbols such as alpha, beta, or integral signs.
	init = function()
		vim.env.PYTHONUTF8 = "1"
	end,

	-- The defaults render in normal mode and reveal the Markdown source in
	-- insert mode. These explicit options document the behavior for later.
	opts = {
		enabled = true,
		render_modes = { "n", "c", "t" },
		heading = { sign = false },
		code = { sign = false },
		latex = {
			-- Turn on / off latex rendering.
			enabled = true,
			-- Additional modes to render latex.
			render_modes = false,
			-- Executable used to convert latex formula to rendered unicode.
			-- If a list is provided the commands run in order until the first success.
			converter = { 'utftex', 'latex2text' },
			-- Render inline latex formulas.
			inline = true,
			-- Render block latex formulas.
			block = true,
			-- Highlight for latex blocks.
			highlight = 'RenderMarkdownMath',
			-- Determines where latex formula is rendered relative to block.
			-- | above  | above latex block                               |
			-- | below  | below latex block                               |
			-- | center | centered with latex block (must be single line) |
			position = 'center',
			-- Number of empty lines above latex blocks.
			top_pad = 0,
			-- Number of empty lines below latex blocks.
			bottom_pad = 0,
		},
	},

	keys = {
		{
			"<leader>mt",
			"<cmd>RenderMarkdown buf_toggle<cr>",
			desc = "Toggle Markdown rendering",
		},
		{
			"<leader>mp",
			"<cmd>RenderMarkdown preview<cr>",
			desc = "Markdown side preview",
		},
	},
}
