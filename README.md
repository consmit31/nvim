# Neovim Config

**Leader**: `<Space>`

## Navigation

### Tmux Navigator (`vim-tmux-navigator`)

Seamless pane navigation between Neovim splits and tmux panes.

| Key | Action |
|-----|--------|
| `<C-h>` | Navigate left |
| `<C-j>` | Navigate down |
| `<C-k>` | Navigate up |
| `<C-l>` | Navigate right |

> Also works in terminal mode (exits insert first).

---

### Neo-tree

File explorer sidebar.

| Key | Action |
|-----|--------|
| `<C-n>` | Open file tree |
| `<C-m>` | Close file tree |

Inside Neo-tree: `a`=add, `d`=delete, `r`=rename, `y`=copy, `c`=cut, `p`=paste, `?`=help.

---

### Harpoon

Quick-access bookmarks for frequently used files.

| Key | Action |
|-----|--------|
| `<leader>a` | Add current file |
| `<C-e>` | Open harpoon list (Telescope UI) |
| `<leader><leader>q` | Jump to file 1 |
| `<leader><leader>w` | Jump to file 2 |
| `<leader><leader>e` | Jump to file 3 |
| `<leader><leader>r` | Jump to file 4 |
| `<leader><leader>1` | Replace slot 1 with current file |
| `<leader><leader>2` | Replace slot 2 with current file |
| `<leader><leader>3` | Replace slot 3 with current file |
| `<leader><leader>4` | Replace slot 4 with current file |
| `<C-S-P>` | Previous harpoon file |
| `<C-S-N>` | Next harpoon file |

---

### Telescope

Fuzzy finder for files, grep, buffers, and more.

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search text) |
| `<leader>fb` | Open buffers |
| `<leader>fh` | Help tags |

Inside Telescope: `<C-n>`/`<C-p>` navigate, `<CR>` select, `<C-x>` split, `<C-v>` vsplit, `<Esc>` close.

---

### Barbar

Tab bar for open buffers.

| Key | Action |
|-----|--------|
| `<A-,>` | Previous buffer |
| `<A-.>` | Next buffer |
| `<A-<>` | Move buffer left |
| `<A->>` | Move buffer right |
| `<A-1>` … `<A-9>` | Jump to buffer 1–9 |
| `<A-0>` | Last buffer |
| `<A-p>` | Pin/unpin buffer |
| `<A-c>` | Close buffer |
| `<C-p>` | Pick buffer (interactive) |
| `<Space>bb` | Sort by buffer number |
| `<Space>bn` | Sort by name |
| `<Space>bd` | Sort by directory |
| `<Space>bl` | Sort by language |
| `<Space>bw` | Sort by window number |

---

## Terminal

### ToggleTerm

Floating terminal with lazygit and lazydocker integration.

| Key | Action |
|-----|--------|
| `<C-\>` | Toggle floating terminal |
| `<C-g>` | Toggle lazygit |
| `<C-d>` | Toggle lazydocker |

In terminal mode, `<C-h/j/k/l>` navigate between panes (exits terminal insert mode automatically).

---

## LSP

### nvim-lspconfig + Mason

LSP keymaps active on any buffer with an attached LSP.

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gi` | Go to implementation |
| `gr` | Go to references |
| `gy` | Go to type definition |
| `gD` | Go to declaration |
| `K` | Hover documentation |
| `gk` | Signature help |
| `gl` | Open diagnostics float |
| `gG` | All project diagnostics |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>f` | Format buffer |

**Mason commands**: `:Mason` open UI, `:MasonInstall <tool>` install tool.

**LSP servers**: `lua_ls`, `ts_ls`, `jsonls`, `pyright` (auto-installed). `sourcekit` for Swift/ObjC (requires Xcode CLI tools).

---

### Trouble

Diagnostic list panel.

| Key | Action |
|-----|--------|
| `<leader>xX` | All project diagnostics |
| `<leader>xx` | Buffer diagnostics |
| `<leader>cs` | Symbols panel |
| `<leader>cl` | LSP definitions/references panel |
| `<leader>xL` | Location list |
| `<leader>xQ` | Quickfix list |

---

## Completion

### blink.cmp

Auto-completion with LSP, snippets, path, and buffer sources.

| Key | Action |
|-----|--------|
| `Tab` | Select next / accept suggestion |
| `S-Tab` | Select previous |
| `<C-Space>` | Open menu or open docs |
| `<C-e>` | Hide menu |
| `<C-n>` / `<C-p>` | Navigate items |
| `<C-k>` | Toggle signature help |

Sources: LSP → path → snippets → buffer.

---

## Formatting & Linting

### Conform

Auto-formats on save:
- **Swift**: `swiftformat`
- **Python**: `ruff_format`

No manual keybinding needed — runs automatically. For other filetypes use `<leader>f` (LSP format).

### none-ls

Handles **Lua** formatting via `stylua` (triggered via `<leader>f`). Also provides these alternate LSP keymaps:

| Key | Action |
|-----|--------|
| `<leader>gd` | Go to definition |
| `<leader>gr` | Go to references |
| `<leader>gi` | Go to implementation |
| `<leader>gt` | Go to type definition |
| `<leader>gs` | Signature help |
| `<leader>gh` | Hover docs |
| `<leader>gf` | Format buffer |

### nvim-lint

Auto-lints Swift files with `swiftlint` on save, read, and leaving insert mode. No manual keybinding.

---

## Debugging (nvim-dap)

DAP UI opens/closes automatically on session start/end.

### DAP Controls

| Key | Action |
|-----|--------|
| `<leader>dc` | Continue |
| `<leader>ds` | Step over |
| `<leader>di` | Step into |
| `<leader>do` | Step out |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Conditional breakpoint |

### JavaScript / TypeScript Debug (buffer-local, `.js/.ts/.jsx/.tsx` files)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>dd` | n | Start / continue |
| `<leader>dx` | n | Terminate |

Two launch configs available (selected via DAP prompt): **Launch file** (runs current file with Node) and **Attach** (attach to running process).

### Python Debug (buffer-local, `.py` files only)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>dd` | n | Start / continue |
| `<leader>dt` | n | Debug test method |
| `<leader>dT` | n | Debug test class |
| `<leader>dv` | v | Debug selection |
| `<leader>dx` | n | Terminate |

---

## Editing Utilities

### Comment.nvim

| Key | Mode | Action |
|-----|------|--------|
| `gcc` | n | Toggle line comment |
| `gbc` | n | Toggle block comment |
| `gc` | v | Toggle line comment |
| `gb` | v | Toggle block comment |

### nvim-autopairs

Auto-closes `()`, `[]`, `{}`, `""`, `''` in insert mode. No keybinding needed.

### nvim-emmet

| Key | Mode | Action |
|-----|------|--------|
| `<leader>xe` | n, v | Wrap selection with Emmet abbreviation |

### Fluoride (color picker)

| Key | Action |
|-----|--------|
| `<leader>cp` | Open color picker |

---

## Appearance

### Catppuccin

Colorscheme: Mocha (dark) / Latte (light), transparent background. Toggle with `:set background=dark/light`.

### Lualine

Status line using `powerline_dark` theme. No keybindings.

### Snacks.nvim

Provides: animated scrolling, dashboard, indent guides, notifications, input UI, scope highlighting, status column, word highlighting. No manual keybindings configured.

### Treesitter

Syntax highlighting for Lua, Elixir, Swift, Python (and auto-installs others). No keybindings.

---

## AI

### GitHub Copilot

| Key | Action |
|-----|--------|
| `Tab` | Accept suggestion |
| `<M-]>` | Next suggestion |
| `<M-[>` | Previous suggestion |
| `<C-]>` | Dismiss suggestion |

---

## Plugin Management

```
:Lazy          # Open plugin manager
:Lazy sync     # Update all plugins
:Lazy clean    # Remove unused plugins
:Mason         # Open Mason (LSP/tool installer)
```
