local langs = {
  "bash",
  "c",
  "cmake",
  "comment",
  "cpp",
  "css",
  "diff",
  "dockerfile",
  "git_config",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "go",
  "gomod",
  "gosum",
  "gowork",
  "graphql",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "jsonc",
  "lua",
  "luadoc",
  "luap",
  "make",
  "markdown",
  "markdown_inline",
  "nix",
  "printf",
  "python",
  "query",
  "regex",
  "rst",
  "ruby",
  "rust",
  "scss",
  "sql",
  "ssh_config",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
  "zig",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })
      -- nvim-treesitter main runs `tree-sitter build`. Homebrew's `tree-sitter`
      -- formula is only the library; the CLI is `tree-sitter-cli`.
      if vim.fn.executable("tree-sitter") == 0 then
        vim.notify(
          "tree-sitter CLI missing. Install it, then :TSUpdate\n  brew install tree-sitter-cli",
          vim.log.levels.WARN
        )
        return
      end
      require("nvim-treesitter").install(langs)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    opts = { max_lines = 3 },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    opts = {},
  },
}
