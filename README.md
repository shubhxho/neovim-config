# neovim-config

A complete Neovim **0.12+** config. Native LSP 3.18 features (inline completion,
on-type format, linked edits, document color, code lens), treesitter `main`,
Rust blink.cmp, and Snacks (picker, explorer, image, profiler).

## Install

```bash
# backup anything already there
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true

git clone https://github.com/shubhxho/neovim-config.git ~/.config/nvim
nvim
```

First launch clones lazy.nvim, installs plugins, builds blink’s fuzzy matcher,
and Mason pulls language servers. That needs network, a C compiler, Rust
(`rustup`) for blink, and `tree-sitter` CLI ≥ 0.26.1 (`brew install tree-sitter`).

```bash
brew install neovim ripgrep fd tree-sitter lazygit yazi ffmpeg imagemagick
```

Requires **Neovim 0.12 or later**. This machine already has 0.12.5.

## Stack

| Layer | Plugin |
|---|---|
| Manager | lazy.nvim |
| UI | catppuccin, mini.statusline, dropbar, which-key, ufo, trouble |
| Navigation | snacks.nvim (picker, explorer, terminal, zen, image, profiler) |
| Edit | mini.nvim, oil, yazi, flash, yanky, grug-far, persistence |
| Treesitter | nvim-treesitter **main**, context, textobjects |
| LSP | mason + `automatic_enable`, nvim-lspconfig, lazydev (no fidget/aerial) |
| Rust | rustaceanvim + its neotest adapter |
| TypeScript | **vtsls** + nvim-vtsls + ts-error-translator |
| Completion | blink.cmp + blink.lib + lazydev; native `vim.lsp.inline_completion` |
| Python | Astral **ty** + **ruff** (pyright left off auto-enable) |
| Format / lint | conform.nvim, nvim-lint, LSP on-type formatting |
| Git | gitsigns, neogit, diffview, git-conflict, lazygit, `:DiffTool` |
| Debug | nvim-dap, dap-ui, mason-nvim-dap, dap-go, dap-python |
| Test | neotest (python, go, rust, jest), overseer |
| Extra | ts-comments, quicker, rainbow-delimiters, otter, sidekick |
| AI | copilot-language-server (native ghost text), codecompanion |
| Builtins | `:Undotree`, `:DiffTool` via `packadd` |

Language defaults live in `lsp/*.lua` and are consumed by Neovim 0.11+ natively.

## Keys (leader is space)

| Key | Action |
|---|---|
| `<space><space>` / `<leader>ff` | Files |
| `<leader>/` | Grep |
| `<leader>e` | Explorer |
| `<leader>fy` | Yazi |
| `<leader>gg` | Lazygit |
| `gd` `grr` `gra` `grn` | LSP (native + picker) |
| `<leader>cf` | Format |
| `<C-l>` (insert) | Accept native inline completion |
| `<leader>aa` | AI actions |
| `<leader>uu` | Undotree |
| `<c-/>` | Terminal |
| `<leader>L` | Lazy |
| `<leader>cm` | Mason |

Press space and wait for which-key.

## Layout

```
init.lua
lua/config/     options, keymaps, autocmds, lazy bootstrap
lua/plugins/    one file per concern
lsp/            native server settings
```

## Update

`:Lazy sync` · `:TSUpdate` · `:MasonUpdate`
