-- ============================================================================
-- Avante.nvim - AI-powered code assistant
-- ============================================================================
-- Loading Strategy: Tier 3 (On-Demand via cmd/keys)
-- Trigger: Commands or keybindings
-- Previous: event="VeryLazy" (loads ~100ms after startup)
-- Optimized: True on-demand loading via explicit triggers
-- ============================================================================

return {
  "yetone/avante.nvim",

  -- Tier 3: Load only when explicitly invoked
  lazy = true,

  -- Build configuration
  build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",

  version = false,

  -- Command triggers (replace event = "VeryLazy")
  cmd = {
    "AvanteAsk",
    "AvanteEdit",
    "AvanteToggle",
    "AvanteRefresh",
    "AvanteFocus",
    "AvanteSwitchProvider",
  },

  -- Keybinding triggers
  keys = {
    { "<leader>aa", "<cmd>AvanteAsk<cr>", desc = "Avante Ask" },
    { "<leader>ae", "<cmd>AvanteEdit<cr>", desc = "Avante Edit", mode = { "n", "v" } },
    { "<leader>at", "<cmd>AvanteToggle<cr>", desc = "Avante Toggle" },
    { "<leader>ar", "<cmd>AvanteRefresh<cr>", desc = "Avante Refresh" },
  },

  ---@module 'avante'
  ---@type avante.Config
  opts = {
    instructions_file = "avante.md",
    behaviour = {
      -- auto_suggestions = true,
    },
    providers = {
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-sonnet-4-20250514",
        timeout = 30000,
      },
      moonshot = {
        endpoint = "https://api.moonshot.ai/v1",
        model = "kimi-k2-0711-preview",
        timeout = 30000,
      },
    },
  },

  -- Dependencies (only those not provided by LazyVim)
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "HakonHarnes/img-clip.nvim",
      lazy = true, -- Load with parent
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
