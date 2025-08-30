local function tinymist_root()
	local clients = vim.lsp.get_clients({ bufnr = 0 })

	---@type vim.lsp.Client|nil
	local tinymist = vim.iter(clients)
		:find(function(client)
			return client.name == "tinymist"
		end)

	return tinymist
		and tinymist.config
		and tinymist.config.settings
		and tinymist.config.settings.rootPath
end

return {
	'chomosuke/typst-preview.nvim',
	event = "LspAttach",
	ft = 'typst',
	version = '1.*',
	opts = {
		open_cmd = nil,
		port = 5555,
		dependencies_bin = {
			['tinymist'] = 'tinymist',
			['websocat'] = 'websocat',
		},
		get_root = function(path_of_main_file)
			local root = tinymist_root()
			if root then
				return root
			else
				local path = vim.fn.fnamemodify(path_of_main_file, ':p:h')
                vim.notify("Could not get Tinymist rootPath; defaulting to" .. path, vim.log.levels.WARN)
				return path
			end
		end
	}, -- lazy.nvim will implicitly calls `setup {}`
}
