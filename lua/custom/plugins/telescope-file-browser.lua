return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  keys = {
    {
      '<leader>se',
      function()
        require('telescope').extensions.file_browser.file_browser {
          path = '%:p:h',
          select_buffer = true,
          hidden = require('custom.utils').show_hidden,
        }
      end,
      desc = '[S]earch file [E]xplorer',
    },
  },
  config = function()
    require('telescope').load_extension 'file_browser'
  end,
}
