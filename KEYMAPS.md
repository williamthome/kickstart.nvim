# Neovim Keymaps Reference

Leader key: `<Space>`

## Buffers (Tabs)

| Key | Action |
|-----|--------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<leader>x` | Close current buffer |
| `<leader>1-9` | Jump to buffer by position |
| `<leader>bp` | Pick buffer (jump mode with letters) |
| `<leader>bx` | Pick buffer to close |
| `<leader>bo` | Close all other buffers |
| `<leader>bl` | Close buffers to the right |
| `<leader>bh` | Close buffers to the left |
| `<leader>b>` | Move buffer right |
| `<leader>b<` | Move buffer left |
| `<leader><leader>` | Telescope buffer picker |
| `<Del>` | Delete buffer (in Telescope buffer picker) |

## File Explorer (Neo-tree)

| Key | Action |
|-----|--------|
| `\` | Toggle Neo-tree |
| `Y` | Copy file path (picker with multiple formats) |

## Search (Telescope)

| Key | Action |
|-----|--------|
| `<leader>sf` | Search files |
| `<leader>sg` | Search by grep (live grep) |
| `<leader>sw` | Search current word |
| `<leader>sh` | Search help |
| `<leader>sk` | Search keymaps |
| `<leader>ss` | Search Telescope builtins |
| `<leader>sd` | Search diagnostics |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Search recent files |
| `<leader>/` | Fuzzy search in current buffer |
| `<leader>s/` | Live grep in open files |

### Inside Telescope Picker

| Key | Action |
|-----|--------|
| `<C-j>` | Move selection down |
| `<C-k>` | Move selection up |
| `<C-p>` | Toggle preview |
| `<C-f>` | Filter by directory |
| `<C-y>` | Copy file path |
| `Y` (normal) | Copy file path |
| `<C-Up>` | Previous search history |
| `<C-Down>` | Next search history |
| `<C-u>` | Scroll preview up |
| `<C-d>` | Scroll preview down |

## LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition (also handles Erlang includes) |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `gD` | Go to declaration |
| `<leader>D` | Type definition |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action |

## Windows

| Key | Action |
|-----|--------|
| `<C-h>` | Move to left window |
| `<C-l>` | Move to right window |
| `<C-j>` | Move to lower window |
| `<C-k>` | Move to upper window |
| `<leader>wh` | Set window height |
| `<leader>ww` | Set window width |

## Git

| Key | Action |
|-----|--------|
| `<leader>lg` | Open LazyGit |

## Sessions

| Key | Action |
|-----|--------|
| `<leader>wr` | Search sessions |
| `<leader>ws` | Save session |
| `<leader>wa` | Toggle autosave |

## Bookmarks

| Key | Action |
|-----|--------|
| `<leader>mc` | Bookmark commands |
| `<leader>mg` | Bookmark grep |
| `<leader>ml` | Bookmark lists |
| `<leader>mm` | Mark current line |
| `<leader>mo` | Open active bookmark list |
| `<leader>mt` | Bookmark tree |

## General

| Key | Action |
|-----|--------|
| `<Esc>` | Clear search highlights |
| `<leader>q` | Open diagnostic quickfix list |
| `J` (visual) | Move selected lines down |
| `K` (visual) | Move selected lines up |
| `<Esc><Esc>` | Exit terminal mode |
