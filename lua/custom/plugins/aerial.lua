return {
  'stevearc/aerial.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  event = 'BufReadPost',
  keys = {
    { '<leader>ta', '<cmd>AerialToggle!<CR>', desc = '[T]oggle [A]erial outline' },
    { '<leader>ds', '<cmd>Telescope aerial<CR>', desc = '[D]ocument [S]ymbols (aerial)' },
  },
  opts = {
    layout = {
      default_direction = 'left',
      min_width = 30,
    },
    attach_mode = 'global',
    filter_kind = false,
    disable_max_lines = 0,
    disable_max_size = 0,
    manage_folds = false,
    show_guides = true,
    close_automatic_events = {},
    post_jump_cmd = 'normal! zz',
    open_automatic = true,
    on_first_symbols = function(bufnr)
      require('aerial').tree_set_collapse_level(bufnr, 0)
    end,
  },
  config = function(_, opts)
    require('aerial').setup(opts)
    pcall(require('telescope').load_extension, 'aerial')
  end,
}
