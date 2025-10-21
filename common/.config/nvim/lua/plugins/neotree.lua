return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  event_handlers = {
    event = "file_opened",
    handler = function(file_path)
      -- auto close
      -- vimc.cmd("Neotree close")
      -- OR
      require("neo-tree.command").execute({ action = "close" })
    end
  },
  config = function() 
    vim.keymap.set('n', '<C-e>', ':Neotree filesystem reveal toggle left<CR>')
  end
}
