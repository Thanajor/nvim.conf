return {
	'chomosuke/typst-preview.nvim',
	ft = 'typst',
	version = '1.*',
	opts = {
		open_cmd = nil,
		port = 5555,
	}, -- lazy.nvim will implicitly calls `setup {}`
}
