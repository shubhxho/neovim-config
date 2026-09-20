return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.align").setup()
      require("mini.bracketed").setup()
      require("mini.comment").setup()
      require("mini.files").setup()
      require("mini.icons").setup()
      require("mini.move").setup()
      require("mini.operators").setup()
      require("mini.pairs").setup()
      require("mini.splitjoin").setup()
      require("mini.surround").setup()
      require("mini.trailspace").setup()
    end,
    keys = {
      {
        "<leader>fm",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Mini files",
      },
    },
  },
  {
    "stevearc/oil.nvim",
    opts = { view_options = { show_hidden = true }, default_file_explorer = false },
    keys = { { "-", "<cmd>Oil<cr>", desc = "Oil" } },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote flash" },
    },
  },
  {
    "gbprod/yanky.nvim",
    opts = { ring = { storage = "shada" } },
    keys = {
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put after" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put before" },
      { "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Yank previous" },
      { "<c-n>", "<Plug>(YankyNextEntry)", desc = "Yank next" },
    },
  },
  {
    "MagicDuck/grug-far.nvim",
    opts = {},
    keys = {
      { "<leader>sR", function() require("grug-far").open() end, desc = "Search and replace" },
    },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore session" },
      { "<leader>qS", function() require("persistence").select() end, desc = "Select session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore last session" },
    },
  },
  { "nmac427/guess-indent.nvim", opts = {} },
  {
    "andymass/vim-matchup",
    event = "VeryLazy",
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
}
