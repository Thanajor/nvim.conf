
return {
  'stevearc/conform.nvim',
  opts = {
	   formatters_by_ft = { 
		   -- python = { "ruff"}, 
    		rust = { "rustfmt", lsp_format = "fallback" },
    		typst = { "typstyle" },
		},
  },
  config = function()
	  vim.api.nvim_create_autocmd("BufWritePre", {
		  pattern = "*",
		  callback = function(args)
			  require("conform").format({ bufnr = args.buf })
		  end,
	  })
  end
}
