local M = {}

--- Show a picker to copy a file path in various formats to the clipboard.
---@param filepath string
M.copy_path_picker = function(filepath)
  local relative = vim.fn.fnamemodify(filepath, ':.')
  local absolute = vim.fn.fnamemodify(filepath, ':p')
  local filename = vim.fn.fnamemodify(filepath, ':t')
  local stem = vim.fn.fnamemodify(filepath, ':t:r')
  local dir = vim.fn.fnamemodify(filepath, ':h')

  vim.ui.select({
    'Relative path: ' .. relative,
    'Absolute path: ' .. absolute,
    'Filename (no ext): ' .. stem,
    'Filename: ' .. filename,
    'Directory: ' .. dir,
  }, { prompt = 'Copy to clipboard:' }, function(choice)
    if choice then
      local value = choice:match ': (.+)$'
      vim.fn.setreg('+', value)
      vim.notify('Copied: ' .. value)
    end
  end)
end

--- Resolve and open an Erlang -include or -include_lib file from the current line.
M.goto_erlang_include = function()
  local line = vim.api.nvim_get_current_line()

  -- Match -include_lib("app/rest/of/path.hrl") or -include("path.hrl")
  local is_lib, path = line:match '%-include(_lib)?%(%s*"([^"]+)"%s*%)'
  if not path then
    -- Try include_lib explicitly
    path = line:match '%-include_lib%(%s*"([^"]+)"%s*%)'
    if path then
      is_lib = '_lib'
    else
      path = line:match '%-include%(%s*"([^"]+)"%s*%)'
    end
  end

  if not path then
    vim.notify('No -include or -include_lib found on this line', vim.log.levels.WARN)
    return
  end

  if is_lib == '_lib' or line:match '%-include_lib' then
    -- include_lib: first component is app name
    local app, rest = path:match '^([^/]+)/(.+)$'
    if not app then
      vim.notify('Invalid include_lib path: ' .. path, vim.log.levels.ERROR)
      return
    end

    local cmd = string.format("erl -noshell -eval 'io:format(\"~s\", [code:lib_dir(%s)]), halt().'", app)
    vim.fn.jobstart(cmd, {
      stdout_buffered = true,
      on_stdout = function(_, data)
        local lib_dir = table.concat(data, '')
        if lib_dir == '' or lib_dir:match 'error' then
          -- Fallback: search in _build, then try full path relative to project root
          local project_root = vim.fn.getcwd()
          local fallbacks = {
            project_root .. '/_build/default/lib/' .. app .. '/' .. rest,
            project_root .. '/' .. path,
          }
          for _, fb in ipairs(fallbacks) do
            if vim.fn.filereadable(fb) == 1 then
              vim.schedule(function() vim.cmd('edit ' .. fb) end)
              return
            end
          end
          vim.schedule(function() vim.notify('Could not resolve: ' .. path, vim.log.levels.ERROR) end)
          return
        end
        local resolved = lib_dir .. '/' .. rest
        vim.schedule(function()
          if vim.fn.filereadable(resolved) == 1 then
            vim.cmd('edit ' .. resolved)
          else
            vim.notify('File not found: ' .. resolved, vim.log.levels.ERROR)
          end
        end)
      end,
    })
  else
    -- include: resolve relative to current file, then project root
    local current_dir = vim.fn.expand '%:p:h'
    local candidates = {
      current_dir .. '/' .. path,
      current_dir .. '/include/' .. path,
      vim.fn.getcwd() .. '/' .. path,
      vim.fn.getcwd() .. '/include/' .. path,
    }

    for _, candidate in ipairs(candidates) do
      if vim.fn.filereadable(candidate) == 1 then
        vim.cmd('edit ' .. candidate)
        return
      end
    end

    vim.notify('File not found: ' .. path, vim.log.levels.WARN)
  end
end

return M
