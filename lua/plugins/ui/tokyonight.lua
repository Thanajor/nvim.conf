return {
	'folke/tokyonight.nvim',
	priority = 1000, -- Make sure to load this before all the other start plugins.
	opts = {
		style = "storm",
		-- transparent = true,

	init = function()
		vim.cmd [[colorscheme tokyonight]]
	end,
}
