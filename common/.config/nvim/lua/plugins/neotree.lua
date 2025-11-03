return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker"
  },
  -- event_handlers = {
    --   event = "file_opened",
    --   handler = function(file_path)
      --     -- auto close
      --      -- vim.cmd("Neotree close")
      --     -- OR
      --     require("neo-tree.command").execute({ action = "close" })
      --   end
      -- },
      config = function() 
        vim.keymap.set('n', '<C-e>', ':Neotree filesystem reveal toggle left<CR>')
        vim.keymap.set('n', '<Leader>ee', ':Neotree filesystem reveal focus left<CR>')
      end
    }
