return {
	'nvim-telescope/telescope.nvim', version = '*',
	dependencies = { 'nvim-lua/plenary.nvim' },

	config = function()
		require('telescope').setup({})

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Find files' })
		vim.keymap.set('n', '<leader>pw', builtin.live_grep, { desc = 'Search project text' })
		vim.keymap.set('n', '<leader>ps', builtin.grep_string, { desc = 'Search word under cursor' })
		--vim.keymap.set('n', '<C-p>', builtin.git_files, {})
		--vim.keymap.set('n', '<leader>pws', function()
			--local word = vim.fn.expand("<cword>")
			--builtin.grep_string({ search = word })
		--end)
		--vim.keymap.set('n', '<leader>pWs', function()
			--local word = vim.fn.expand("<cWORD>")
			--builtin.grep_string({ search = word })
		--end)
		--vim.keymap.set('n', '<leader>ps', function()
			--builtin.grep_string({ search = vim.fn.input("Grep > ") })
		--end)
		--vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
	end
}
