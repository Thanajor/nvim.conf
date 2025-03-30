return {
	"neovim/nvim-lspconfig",
	dependencies = { 'saghen/blink.cmp' },

	config = function ()
		local capabilities = require('blink.cmp').get_lsp_capabilities()
		local lspconfig = require('lspconfig')
		-- ------------------------------------------------------------------
		require("lspconfig").basedpyright.setup {
			settings = {
				basedpyright = {
				disableOrganizeImports = true,
					analysis = {
						ignore = { '*' },
					}
				}
			}
		}
		require('lspconfig').ruff.setup{}
		lspconfig['basedpyright'].setup({ capabilities = capabilities })

		require("lspconfig")["tinymist"].setup {
			settings = {
				formatterMode = "typstyle",
				exportPdf = "onDocumentHasTitle",
				-- semanticTokens = "disable"
			}
		}
		lspconfig['tinymist'].setup({ capabilities = capabilities })
	end,
}
