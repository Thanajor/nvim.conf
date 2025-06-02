local keymaps = {
    ["g?"] = { "actions.show_help", mode = "n" },
    ["<CR>"] = "actions.select",
    ["<C-s>"] = { "actions.select", opts = { vertical = true } },
    ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
    ["<C-t>"] = { "actions.select", opts = { tab = true } },
    ["<C-p>"] = "actions.preview",
    ["q"] = { "actions.close", mode = "n" },
    ["<C-l>"] = "actions.refresh",
    ["-"] = { "actions.parent", mode = "n" },
    ["_"] = { "actions.open_cwd", mode = "n" },
    ["`"] = { "actions.cd", mode = "n" },
    ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
    ["gs"] = { "actions.change_sort", mode = "n" },
    ["gx"] = "actions.open_external",
    ["g."] = { "actions.toggle_hidden", mode = "n" },
    ["g\\"] = { "actions.toggle_trash", mode = "n" },
}

if vim.fn.executable("dragon-drop") == 1 then
    keymaps["gd"] = {
        callback = function(bufnr)
            local oil = require("oil")
            local entry = oil.get_cursor_entry()

            if not entry or not entry.name then
                vim.notify("No file selected for drag", vim.log.levels.WARN)
                return
            end

            local path = oil.get_current_dir(bufnr)
            local cmd = 'dragon-drop ' .. vim.fn.shellescape(path .. entry.name)
            vim.notify("Dragging file: " .. path .. entry.name, vim.log.levels.INFO)
            vim.fn.system(cmd)
        end,
        -- TODO: Implement refactor for visual mode
        nowait = true,
        mode = {"n"},
        desc = "Drag file with dragon-drop"
    }
end
return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
skip_confirm_for_simple_edits = true,

    columns = {
      'icon',
      -- "permissions",
      'size',
      -- "mtime",
    },
keymaps = keymaps,
    view_options = {
        sort = {
            { "mtime", "desc" },
            { "name", "asc" },
        },
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,

vim.keymap.set('n', '<leader>o', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
}
