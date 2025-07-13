return {
	'chomosuke/typst-preview.nvim',
	ft = 'typst',
	version = '1.*',
	opts = {
		open_cmd = nil,
		port = 5555,
		dependencies_bin = {
			['tinymist'] = 'tinymist',
			['websocat'] = 'websocat',
		},
	}, -- lazy.nvim will implicitly calls `setup {}`
}
