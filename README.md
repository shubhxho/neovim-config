# neovim-config

A complete Neovim **0.12+** config. Native LSP (`vim.lsp.config` / `vim.lsp.enable`),
treesitter `main`, Rust-backed blink.cmp, and Snacks for pickers, explorer, and
the terminal.

## Install

```bash
# backup anything already there
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true

git clone <this-repo> ~/.config/nvim
nvim
```

First launch clones lazy.nvim, installs plugins, builds blink’s fuzzy matcher,
and Mason pulls language servers. That needs network, a C compiler, Rust
(`rustup`) for blink, and `tree-sitter` CLI ≥ 0.26.1 (`brew install tree-sitter`).

```bash
brew install neovim ripgrep fd tree-sitter lazygit
```

Requires **Neovim 0.12 or later**. This machine already has 0.12.5.

## Stack

| Layer | Plugin |
|---|---|
| Manager | lazy.nvim |
| UI | catppuccin, lualine, noice, which-key, ufo, trouble |
| Navigation | snacks.nvim (picker, explorer, terminal, zen, dashboard) |
| Edit | mini.nvim, oil, flash, yanky, grug-far, persistence |
| Treesitter | nvim-treesitter **main**, context, textobjects |
| LSP | mason, mason-lspconfig `automatic_enable`, nvim-lspconfig, lazydev, aerial |
| Rust | rustaceanvim (not mason rust-analyzer) |
| TypeScript | typescript-tools (ts_ls excluded from auto-enable) |
| Completion | blink.cmp + blink.lib + copilot via blink-copilot |
| Format / lint | conform.nvim, nvim-lint |
| Git | gitsigns, neogit, diffview, git-conflict, lazygit |
| Debug | nvim-dap, dap-ui, mason-nvim-dap, dap-go, dap-python |
| Test | neotest (python, go, rust, jest), overseer |
| AI | copilot.lua, codecompanion |

Language defaults live in `lsp/*.lua` and are consumed by Neovim 0.11+ natively.

## Keys (leader is space)

| Key | Action |
|---|---|
| `<space><space>` / `<leader>ff` | Files |
| `<leader>/` | Grep |
| `<leader>e` | Explorer |
| `<leader>gg` | Lazygit |
| `gd` `grr` `gra` `grn` | LSP (native + picker) |
| `<leader>cf` | Format |
| `<leader>aa` | AI actions |
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
