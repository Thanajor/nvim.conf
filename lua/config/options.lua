vim.o.winborder = 'rounded'
vim.diagnostic.config({
  virtual_text = true,
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
