return {
  "saghen/blink.cmp",
  ---@class PluginLspOpts
  opts = {
    signature = { enabled = true },
    keymap = {
      preset = "super-tab",
    },
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
