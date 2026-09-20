# neovim-config

Neovim **0.12+** config. Native LSP 3.18, treesitter `main`, blink.cmp, Snacks.

Repo: https://github.com/shubhxho/neovim-config

## Install

```bash
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true
git clone https://github.com/shubhxho/neovim-config.git ~/.config/nvim
brew install neovim ripgrep fd tree-sitter-cli lazygit yazi ffmpeg imagemagick
nvim
```

First launch installs plugins, builds blink’s Rust matcher, and Mason pulls
servers. You need git, a C compiler, `rustup`, and **`tree-sitter-cli` ≥ 0.26.1**.
Homebrew’s `tree-sitter` formula is only the library; parsers need the CLI.

## Stack

| Area | What |
|---|---|
| UI | catppuccin, mini.statusline, dropbar, which-key, ufo, trouble |
| Find | snacks picker / explorer / terminal / image / profiler |
| Edit | mini.nvim, oil, yazi, flash, yanky, grug-far |
| Treesitter | nvim-treesitter **main** |
| LSP | mason `automatic_enable`, `lsp/*.lua` |
| Rust | rustaceanvim |
| TypeScript | vtsls + nvim-vtsls |
| Python | ty + ruff |
| Complete | blink.cmp + native inline (`<C-l>`) |
| Format | conform + on-type format |
| Git | gitsigns, neogit, `:DiffTool` |
| Debug / test | nvim-dap, neotest, overseer |
| AI | copilot-language-server, codecompanion, sidekick |

## Keys

Leader is space. Press it and wait for which-key.

| Key | Action |
|---|---|
| `<space><space>` | Files |
| `<leader>/` | Grep |
| `<leader>e` | Explorer |
| `<leader>fy` | Yazi |
| `<leader>gg` | Lazygit |
| `gd` `grr` `gra` `grn` | LSP |
| `<leader>cf` | Format |
| `<C-l>` | Accept inline completion |
| `<leader>aa` | AI actions |
| `<leader>as` | Sidekick CLI |
| `<leader>uu` | Undotree |
| `<c-/>` | Terminal |
| `<leader>L` | Lazy |
| `<leader>cm` | Mason |

## Layout

```
init.lua
lua/config/    options, maps, autocmds, 0.12 builtins
lua/plugins/   one file per concern
lsp/           native server settings
```

## Update

`:Lazy sync` · `:TSUpdate` · `:MasonUpdate`
