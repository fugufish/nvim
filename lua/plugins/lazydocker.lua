return {
  {
    "mgierada/lazydocker.nvim",
    config = function()
      require("lazydocker").setup({})
    end,
    event = "BufRead", -- or any other event you might want to use.
  },
}
