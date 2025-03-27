
return {
	{"nvim-treesitter/nvim-treesitter", 
	build = ":TSUpdate",
	config = function()
		require'nvim-treesitter.configs'.setup {
		  ensure_installed = { "markdown", "markdown_inline", "rust", "python", "typst" }
		}
	end,

  }
}
