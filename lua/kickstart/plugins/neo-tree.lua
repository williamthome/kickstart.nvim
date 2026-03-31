-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    window = {
      mappings = {
        ['Y'] = function(state)
          local node = state.tree:get_node()
          require('custom.utils').copy_path_picker(node:get_id())
        end,
        ['<C-p>'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = false } },
        ['O'] = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          vim.fn.jobstart({ 'xdg-open', path }, { detach = true })
        end,
      },
    },
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['H'] = function(state)
            -- Toggle hidden files and sync with telescope
            local utils = require 'custom.utils'
            utils.show_hidden = not utils.show_hidden
            state.filtered_items = state.filtered_items or {}
            state.filtered_items.visible = utils.show_hidden
            require('neo-tree.sources.filesystem.commands').toggle_hidden(state)
          end,
        },
      },
    },
  },
}
