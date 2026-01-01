return {
  "greggh/claude-code.nvim",
  -- Lazy load on command for better startup performance
  cmd = { "ClaudeCode" },
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup()
  end,
}
