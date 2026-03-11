return {
  'jmbuhr/otter.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    -- Setup otter first with Erlang support added
    require('otter').setup {
      lsp = {
        diagnostic_update_events = { 'BufWritePost' },
      },
      buffers = {
        set_filetype = true,
        write_to_disk = false,
      },
      extensions = {
        erlang = 'erl', -- Add Erlang support to otter.nvim
        arizona = 'herl', -- Add Arizona support to otter.nvim
      },
      -- debug = true,
      -- verbose = {
      --   no_code_found = true, -- warn if no injected code found
      -- },
    }

    -- Then activate for Arizona files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'arizona', 'herl' },
      group = vim.api.nvim_create_augroup('EmbedArizona', {}),
      callback = function()
        require('otter').activate { 'html', 'erlang' }
      end,
    })

    -- Activate Arizona language support in Erlang files for template strings
    --vim.api.nvim_create_autocmd('FileType', {
    --  pattern = { 'erlang' },
    --  group = vim.api.nvim_create_augroup('ErlangEmbedArizona', {}),
    --  callback = function()
    --    require('otter').activate { 'arizona' }
    --  end,
    --})
  end,
}
