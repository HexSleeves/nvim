-- ============================================================================
-- CodeCompanion.nvim - AI Coding Assistant
-- ============================================================================
-- Loading Strategy: Tier 3 (On-Demand via cmd/keys)
-- Trigger: Commands or keybindings only
-- Previous Issue: Parse-time autocmds executed on EVERY startup
-- Fix: Moved all autocmds inside config function
-- ============================================================================

return {
  "olimorris/codecompanion.nvim",

  -- Tier 3: Load only when explicitly invoked
  lazy = true,

  -- Command triggers
  cmd = {
    "CodeCompanion",
    "CodeCompanionChat",
    "CodeCompanionActions",
    "CodeCompanionCmd",
    "CodeCompanionToggle",
  },

  -- Keybinding triggers (optional - add if you want keybindings)
  keys = {
    { "<leader>cc", "<cmd>CodeCompanionChat<cr>", desc = "CodeCompanion Chat" },
    { "<leader>ca", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
    { "<leader>ct", "<cmd>CodeCompanionToggle<cr>", desc = "CodeCompanion Toggle" },
  },

  dependencies = {
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "nvim-lua/plenary.nvim" },
  },

  -- All configuration happens ONLY when plugin loads
  config = function()
    -- ========================================================================
    -- CRITICAL: Autocmds are now inside config, only created when plugin loads
    -- ========================================================================
    local group = vim.api.nvim_create_augroup("CodeCompanionHooks", { clear = true })

    local instant_events = {
      Opened = true,
      Hidden = true,
      Closed = true,
      Cleared = true,
      Created = true,
    }

    --- Check if string ends with suffix
    ---@param str string
    ---@param suffix string
    ---@return boolean
    local function endswith(str, suffix)
      return str:sub(-#suffix) == suffix
    end

    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "CodeCompanion*",
      group = group,
      callback = function(request)
        -- Skip chat submitted events
        if request.match == "CodeCompanionChatSubmitted" then
          return
        end

        local event = request.match:gsub("CodeCompanion", "")

        -- Handle request lifecycle - notify on key events
        if endswith(request.match, "Started") or endswith(request.match, "Finished") or instant_events[event] then
          vim.notify("CodeCompanion: " .. event, vim.log.levels.INFO)
        end
      end,
    })

    -- Setup the plugin
    require("codecompanion").setup({
      -- Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
      strategies = {
        chat = { adapter = "copilot" },
        inline = { adapter = "copilot" },
      },
      opts = {
        log_level = "DEBUG",
      },
    })
  end,
}
