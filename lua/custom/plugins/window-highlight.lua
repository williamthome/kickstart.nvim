return {
  {
    'levouh/tint.nvim',
    event = 'WinEnter',
    opts = {
      tint = -30,
      saturation = 0.6,
    },
  },
  {
    'nvim-zh/colorful-winsep.nvim',
    event = 'WinEnter',
    config = function()
      require('colorful-winsep').setup()
      vim.api.nvim_set_hl(0, 'ColorfulWinSep', { fg = '#4a6e3a' })
    end,
  },
}
