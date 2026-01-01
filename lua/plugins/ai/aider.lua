-- ============================================================================
-- Aider.nvim - AI pair programming
-- ============================================================================
-- Loading Strategy: Tier 3 (On-Demand via keys)
-- Trigger: Keybindings only
-- Previous Issue: event="VeryLazy" + keys (redundant, event wins)
-- Fix: Removed event, keys alone handle lazy loading
-- ============================================================================

return {
  "joshuavial/aider.nvim",

  -- Tier 3: Load only when keybindings are pressed
  lazy = true,

  -- NO event trigger - keys already handle lazy loading
  -- event = "VeryLazy",  -- REMOVED

  -- Keys automatically set lazy = true
  keys = {
    { "<leader>ia", "<cmd>AiderOpen<cr>", desc = "Aider Open" },
    { "<leader>ib", "<cmd>AiderBackground<cr>", desc = "Aider Background" },
    { "<leader>ih", "<cmd>AiderAddCurrentFile<cr>", desc = "Aider Add File" },
    { "<leader>id", "<cmd>AiderDrop<cr>", desc = "Aider Drop File" },
  },

  opts = {
    auto_manage_context = true,
    default_bindings = false, -- Disable default bindings to avoid conflict with avante
    debug = false,
  },
}
