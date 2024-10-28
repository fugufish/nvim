return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      {
        "cpb/neotest-rspec",
        branch = "cpb/update-dap-strategy",
      },
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rspec")({
            rspec_cmd = function()
              return vim.tbl_flatten({
                "bundle",
                "exec",
                "rdbg",
                "--nonstop",
                "-c",
                "--",
                "rspec",
              })
            end,
          }),
          require("neotest-jest")({
            jestCommand = "npm run test --",
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
        },
      })
    end,
  },
}
