return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  filters = {
    dotfiles = true
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      update_focused_file = {
        enable = true,
        update_cwd = false
      },
     diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      view = {
        width = 30,
        side = "left",
        -- mappings = {
        --   list = {
            -- { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
            -- { key = "h", cb = tree_cb "close_node" },
            -- { key = "v", cb = tree_cb "vsplit" },
          -- },
        -- },
      },
      on_attach = function(bufnr) 
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        -- custom mappings
        vim.keymap.del('n', '<C-e>', {buffer = bufnr})
        vim.keymap.set('n', '<C-e>', api.tree.close,        opts('Close'))

        vim.keymap.del('n', 'e', {buffer = bufnr})
        vim.keymap.set('n', 'e', function() api.tree.resize({width = 50}) end, opts('Expand width of window'))
        vim.keymap.set('n', 's', function() api.tree.resize({width = 30}) end, opts('Shrink width of window'))

        vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
        vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
         vim.keymap.set("n", "g?",             api.tree.toggle_help,               opts("Help"))
      end
    }
  end,
}
