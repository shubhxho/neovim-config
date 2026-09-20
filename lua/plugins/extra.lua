return {
  { "folke/ts-comments.nvim", event = "VeryLazy", opts = {} },
  {
    "stevearc/quicker.nvim",
    ft = "qf",
    opts = {},
    keys = {
      {
        "<leader>xq",
        function()
          require("quicker").toggle()
        end,
        desc = "Quickfix",
      },
      {
        "<leader>xl",
        function()
          require("quicker").toggle({ loclist = true })
        end,
        desc = "Location list",
      },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.g.rainbow_delimiters = {
        strategy = { [""] = require("rainbow-delimiters").strategy["global"] },
        query = { [""] = "rainbow-delimiters" },
      }
    end,
  },
  {
    "jmbuhr/otter.nvim",
    ft = { "markdown", "quarto" },
    opts = {},
  },
  {
    "folke/sidekick.nvim",
    opts = {
      cli = { mux = { enabled = false } },
    },
    keys = {
      {
        "<tab>",
        function()
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>"
          end
        end,
        expr = true,
        desc = "Next edit suggestion",
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick CLI",
      },
      {
        "<leader>aS",
        function()
          require("sidekick.cli").select()
        end,
        desc = "Sidekick select",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick prompt",
      },
    },
  },
}
