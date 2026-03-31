return {
  'nvim-treesitter/nvim-treesitter-context',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  event = 'BufReadPost',
  config = function()
    require('treesitter-context').setup {
      enable = true,
      max_lines = 3,
    }
    vim.keymap.set('n', '<leader>tc', function()
      require('treesitter-context').toggle()
    end, { desc = '[T]oggle treesitter [C]ontext' })
  end,
}
