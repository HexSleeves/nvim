-- CodeCompanion with noice.nvim compatible notifications
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

return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "nvim-lua/plenary.nvim" },
  },
  opts = {
    -- Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
    strategies = {
      chat = { adapter = "copilot" },
      inline = { adapter = "copilot" },
    },
    opts = {
      log_level = "DEBUG",
    },
  },
}
