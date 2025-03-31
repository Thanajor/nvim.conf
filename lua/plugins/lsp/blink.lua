return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
		preset = 'default',
		['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
		['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
	},
	signature = { enabled = true },
    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = { documentation = { auto_show = false }, ghost_text = { enabled = true } },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = "prefer_rust" }
  },
  opts_extend = { "sources.default" }
}
