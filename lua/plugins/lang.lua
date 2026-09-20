return {
  {
    "mrcjkb/rustaceanvim",
    version = false,
    lazy = false,
    init = function()
      vim.g.rustaceanvim = {
        server = {
          default_settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true, loadOutDirsFromCheck = true },
              check = { command = "clippy" },
              inlayHints = { lifetimeElisionHints = { enable = "skip_trivial" } },
            },
          },
        },
      }
    end,
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      completion = { crates = { enabled = true } },
      lsp = { enabled = true, actions = true, completion = true, hover = true },
    },
  },
  {
    "yioneko/nvim-vtsls",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    dependencies = { "neovim/nvim-lspconfig" },
    keys = {
      { "<leader>co", "<cmd>VtsExec organize_imports<cr>", desc = "Organize imports" },
      { "<leader>cF", "<cmd>VtsExec fix_all<cr>", desc = "TS fix all" },
      { "<leader>cS", "<cmd>VtsExec goto_source_definition<cr>", desc = "TS source definition" },
    },
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    ft = { "typescript", "typescriptreact" },
    opts = {},
  },
  {
    "linux-cultist/venv-selector.nvim",
    ft = "python",
    opts = {},
    keys = { { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Python venv" } },
  },
}
