vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
require("config.lazy")
require("config.keymaps")
require("config.autocmds")
require("config.options")
require("config.clipboard")

local lsp_path = vim.fn.stdpath("config") .. "/lsp"
for _, file in ipairs(vim.fn.readdir(lsp_path)) do
	local server_name = file:match("^(.*)%.lua$")
	if server_name then
		vim.lsp.enable(server_name)
	end
end
