return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-jest",
      "mrcjkb/rustaceanvim",
    },
    keys = {
      { "<leader>tt", function() require("neotest").run.run() end, desc = "Nearest test" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "File tests" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Test summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Test output" },
      { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop test" },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({ runner = "pytest" }),
          require("neotest-go"),
          require("rustaceanvim.neotest"),
          require("neotest-jest")({
            jestCommand = "npm test --",
            cwd = function()
              return vim.fn.getcwd()
            end,
          }),
        },
      })
    end,
  },
  {
    "stevearc/overseer.nvim",
    opts = {},
    keys = {
      { "<leader>tr", "<cmd>OverseerRun<cr>", desc = "Run task" },
      { "<leader>tR", "<cmd>OverseerToggle<cr>", desc = "Tasks" },
    },
  },
}
