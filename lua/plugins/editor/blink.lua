return {
  "saghen/blink.cmp",
  dependencies = { "saghen/blink.lib", version = "2.*" },
  -- blink.cmp v2 build/download system (see :h blink-cmp-installation)
  -- compiles from source if cargo is installed; otherwise downloads the
  -- prebuilt binary from the nearest release tag (re-runs on plugin updates)
  build = function()
    local blink = require("blink.cmp")
    if vim.fn.executable("cargo") == 1 then
      blink.build():pwait()
    else
      blink.download({ match = "v*" }):pwait()
    end
  end,
  ---@class PluginLspOpts
  opts = {
    -- fuzzy = { implementation = "prefer_rust" },
    signature = { enabled = true },
    keymap = { preset = "super-tab" },
    sources = {
      -- adding any nvim-cmp sources here will enable them
      -- with blink.compat
      compat = {},
      default = { "lsp", "path", "snippets", "buffer" },
      per_filetype = {
        codecompanion = { "codecompanion" },
      },
    },
  },
}
