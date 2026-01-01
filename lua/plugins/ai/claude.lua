-- ============================================================================
-- Claude Code - Neovim integration for Claude AI
-- ============================================================================
-- Loading Strategy: Tier 4 (Command-Only)
-- Trigger: :ClaudeCode command only
-- Previous Issue: cmd + event="VeryLazy" conflict (event wins, defeating purpose)
-- Fix: Removed event, kept cmd-only loading
-- ============================================================================

return {
  "greggh/claude-code.nvim",

  -- Tier 4: Load only on command
  lazy = true,

  -- Single command trigger
  cmd = { "ClaudeCode" },

  -- NO event trigger - this was causing the conflict
  -- event = "VeryLazy",  -- REMOVED

  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },

  config = function()
    require("claude-code").setup()
  end,
}
