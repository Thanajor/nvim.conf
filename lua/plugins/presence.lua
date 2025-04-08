return {
	'vyfor/cord.nvim',
	build = ':Cord update',
	opts = {

		editor = {
			icon = "https://i.pinimg.com/736x/08/8b/0a/088b0aba54542c9d9e4058d1806a80fe.jpg",
			client = "neovim",
			tooltip = "Navigating in the sea of work."
		},
		idle = {
			icon = "https://i.pinimg.com/736x/55/45/aa/5545aa35f7a8484614d79f7a2a8136a9.jpg",
			tooltip = "Trust me, I readding the documentacion now."
		},
		assets = {
			['.rs'] = {
				icon = 'https://github.com/RayMarch/ferris3d/raw/main/preview.jpg',
				tooltip = '#[stable(feature = "flawless", since="*")]',
				text = 'Writing in Rust'
			},
		},
	}
}
