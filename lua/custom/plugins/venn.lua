return {
  'jbyuki/venn.nvim',
  keys = {
    { '<leader>vd', '<cmd>set virtualedit=all<CR><C-v>', desc = '[V]enn [D]raw mode', mode = 'n' },
  },
  config = function()
    vim.keymap.set('v', '<leader>vb', ':VBox<CR>', { desc = '[V]enn draw [B]ox' })
  end,
}
