return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local caps = vim.lsp.protocol.make_client_capabilities()
      local ok, blink = pcall(require, "blink.cmp")
      if ok then
        caps = blink.get_lsp_capabilities(caps)
      end
      vim.lsp.config("*", { capabilities = caps })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
        callback = function(args)
          local buf = args.buf
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
          end
          map("gd", function()
            Snacks.picker.lsp_definitions()
          end, "Definition")
          map("gD", function()
            Snacks.picker.lsp_declarations()
          end, "Declaration")
          map("grr", function()
            Snacks.picker.lsp_references()
          end, "References")
          map("gri", function()
            Snacks.picker.lsp_implementations()
          end, "Implementation")
          map("grt", function()
            Snacks.picker.lsp_type_definitions()
          end, "Type definition")
          map("grn", vim.lsp.buf.rename, "Rename")
          map("gra", vim.lsp.buf.code_action, "Code action")
          map("gO", function()
            Snacks.picker.lsp_symbols()
          end, "Document symbols")
          map("K", vim.lsp.buf.hover, "Hover")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>cr", vim.lsp.buf.rename, "Rename")
          map("<leader>cR", function()
            Snacks.rename.rename_file()
          end, "Rename file")
          pcall(vim.lsp.inlay_hint.enable, true, { bufnr = buf })
          pcall(vim.lsp.codelens.refresh)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then
            return
          end
          if client:supports_method("textDocument/inlineCompletion") then
            pcall(vim.lsp.inline_completion.enable, true, { bufnr = buf, client_id = client.id })
          end
          if client:supports_method("textDocument/onTypeFormatting") then
            pcall(vim.lsp.on_type_formatting.enable, true, { bufnr = buf, client_id = client.id })
          end
          if client:supports_method("textDocument/linkedEditingRange") then
            pcall(vim.lsp.linked_editing_range.enable, true, { bufnr = buf, client_id = client.id })
          end
          if client:supports_method("textDocument/documentColor") then
            pcall(function()
              vim.lsp.document_color.enable(true, buf)
            end)
          end
          if client:supports_method("textDocument/codeLens") then
            vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
              buffer = buf,
              callback = vim.lsp.codelens.refresh,
            })
            vim.keymap.set("n", "<leader>cc", vim.lsp.codelens.run, { buffer = buf, desc = "Code lens" })
          end
        end,
      })
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ui = { border = "rounded" },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      automatic_enable = {
        exclude = { "rust_analyzer", "ts_ls", "pyright" },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "stylua",
        "gopls",
        "gofumpt",
        "goimports",
        "golangci-lint",
        "ruff",
        "ty",
        "copilot-language-server",
        "ast-grep",
        "ts_ls",
        "eslint-lsp",
        "prettier",
        "jsonls",
        "yamlls",
        "taplo",
        "clangd",
        "bashls",
        "marksman",
        "dockerls",
        "dockerfile-language-server",
        "terraformls",
        "zls",
        "sqlfluff",
        "shfmt",
        "shellcheck",
      },
      run_on_start = true,
    },
  },
  { "b0o/SchemaStore.nvim", lazy = true },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "snacks.nvim", words = { "Snacks" } },
        { path = "lazy.nvim", words = { "LazyVim" } },
      },
    },
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  {
    "stevearc/aerial.nvim",
    opts = { backends = { "lsp", "treesitter", "markdown" }, layout = { default_direction = "prefer_right" } },
    keys = { { "<leader>co", "<cmd>AerialToggle<cr>", desc = "Outline" } },
  },
}
