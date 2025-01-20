-- https://github.com/LintaoAmons/bookmarks.nvim
return {
  'LintaoAmons/bookmarks.nvim',
  -- pin the plugin at specific version for stability
  -- backup your bookmark sqlite db when there are breaking changes
  tag = 'v2.3.0',
  dependencies = {
    { 'kkharji/sqlite.lua' },
    { 'nvim-telescope/telescope.nvim' },
    { 'stevearc/dressing.nvim' }, -- optional: better UI
  },
  config = function()
    local opts = {}
    require('bookmarks').setup(opts) -- you must call setup to init sqlite db

    vim.keymap.set('n', '<leader>mc', '<cmd>BookmarksCommands<cr>', { desc = 'Book[M]ark [C]ommand trigger' })
    vim.keymap.set('n', '<leader>mg', '<cmd>BookmarksGrep<cr>', { desc = 'Book[M]ark [G]reep' })
    vim.keymap.set('n', '<leader>ml', '<cmd>BookmarksList<cr>', { desc = 'Book[M]ark [L]ists' })
    vim.keymap.set('n', '<leader>mm', '<cmd>BookmarksMark<cr>', { desc = 'Book[M]ark [M]ark current line into active BookmarkList' })
    vim.keymap.set('n', '<leader>mo', '<cmd>BookmarksGoto<cr>', { desc = 'Book[M]ark [O]pen current active BookmarkList' })
    vim.keymap.set('n', '<leader>mt', '<cmd>BookmarksTree<cr>', { desc = 'Book[M]ark [T]ree' })
  end,
}
