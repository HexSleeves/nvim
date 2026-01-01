-- ============================================================================
-- Augment.vim - AI code completion
-- ============================================================================
-- Loading Strategy: Tier 2 (Early Deferred)
-- Trigger: InsertEnter (completion needed when typing)
-- Previous: event="VeryLazy" (loads even if not editing)
-- Optimized: Loads only when entering insert mode
-- ============================================================================

return {
  "augmentcode/augment.vim",

  -- Tier 2: Load when entering insert mode (completion tool)
  lazy = true,

  -- Load when user starts typing
  event = "InsertEnter",

  -- Alternative: Load on command (Tier 4)
  -- cmd = { "Augment" },
}
