vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
-- vim.o.formatexpr = "v:lua.vim.lsp.formatexpr()"
vim.o.winborder = 'rounded'
vim.diagnostic.config({
  virtual_text = {
          prefix = '●', -- could be '■', '▎', 'x'
  },
  signs = true,
  update_in_insert = false,
})
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- See https://neovim.io/doc/user/lsp.html#vim.lsp.foldexpr()
vim.o.foldmethod = 'expr'
vim.o.foldlevel = 99
-- Default to treesitter folding
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method('textDocument/foldingRange') then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end
  end,
})
