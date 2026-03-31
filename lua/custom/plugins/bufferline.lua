return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VimEnter',
  opts = {
    options = {
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(count, level)
        local icon = level:match 'error' and ' ' or ' '
        return ' ' .. icon .. count
      end,
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'File Explorer',
          highlight = 'Directory',
          separator = true,
        },
      },
      custom_filter = function(buf)
        if vim.bo[buf].buftype == 'terminal' then return false end
        local name = vim.api.nvim_buf_get_name(buf)
        if name:match 'claude%-code' then return false end
        return true
      end,
      separator_style = 'slant',
      show_close_icon = false,
      show_buffer_close_icons = false,
    },
  },
  config = function(_, opts)
    require('bufferline').setup(opts)

    vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
    vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
    vim.keymap.set('n', '<leader>bp', '<cmd>BufferLinePick<CR>', { desc = '[B]uffer [P]ick (jump mode)' })
    vim.keymap.set('n', '<leader>bx', '<cmd>BufferLinePickClose<CR>', { desc = '[B]uffer pick and close' })
    vim.keymap.set('n', '<leader>x', function()
      local buf = vim.api.nvim_get_current_buf()
      local alt = vim.fn.bufnr '#'
      if alt ~= -1 and alt ~= buf and vim.api.nvim_buf_is_valid(alt) and vim.bo[alt].buflisted then
        vim.cmd('buffer ' .. alt)
      else
        vim.cmd 'BufferLineCyclePrev'
      end
      if vim.api.nvim_buf_is_valid(buf) then
        vim.cmd('bdelete! ' .. buf)
      end
    end, { desc = 'Close current buffer' })
    vim.keymap.set('n', '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', { desc = '[B]uffer close [O]thers' })
    vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCloseRight<CR>', { desc = '[B]uffer close right' })
    vim.keymap.set('n', '<leader>bh', '<cmd>BufferLineCloseLeft<CR>', { desc = '[B]uffer close left' })
    vim.keymap.set('n', '<leader>b>', '<cmd>BufferLineMoveNext<CR>', { desc = '[B]uffer move right' })
    vim.keymap.set('n', '<leader>b<', '<cmd>BufferLineMovePrev<CR>', { desc = '[B]uffer move left' })
    for i = 1, 9 do
      vim.keymap.set('n', '<leader>' .. i, function()
        require('bufferline').go_to(i, true)
      end, { desc = 'Go to buffer ' .. i })
    end
  end,
}
