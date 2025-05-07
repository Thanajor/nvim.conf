return {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
        style = "storm",
        styles = {
            sidebars = "transparent",
            floats = "transparent"
        },
        -- transparent = true,
        on_highlights = function(hl, c)
            hl.IncSearch = {
                bg = c.blue1,
                fg = c.bg
            }
            hl.FlashLabel = {
                bold = true,
                bg = c.teal,
                fg = c.bg
            }
            hl.CursorLineNr = { bold = true, fg = c.blue1 }
        end,
        cache = true,
    },
    init = function()
        vim.cmd [[colorscheme tokyonight]]
    end
}
