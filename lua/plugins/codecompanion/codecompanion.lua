return {
  "olimorris/codecompanion.nvim",
  config = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim",
  },
  opts = {
    strategies = {},
  },
  init = function()
    require("plugins.codecompanion.fidget-spinner"):init()
  end,
}
