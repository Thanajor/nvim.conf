
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = { "markdown", "markdown_inline", "rust", "python", "typst", "nix" },
		},
	},
}
