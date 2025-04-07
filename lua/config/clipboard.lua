-- Keymaps --
vim.keymap.set({ "n", "v", "x" }, '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Yank to clipboard' })
vim.keymap.set({ "n", "v", "x" }, '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from clipboard' })
-------------

-- Settings --
if vim.env.SSH_TTY then
	vim.g.clipboard = 'osc52'
elseif vim.fn.has "wsl" == 1 then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end
-------------
