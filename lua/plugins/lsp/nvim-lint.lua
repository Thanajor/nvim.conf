return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile"
	},
	config = function()
		require('lint').linters_by_ft = {
			html = { 'htmlhint' },
			css = { 'stylelint' },
			sh = { 'shellcheck' },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave", "TextChanged" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,

}
