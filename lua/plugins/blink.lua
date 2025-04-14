return {
  "saghen/blink.cmp",
  build = "cargo +nightly build --release",
  ---@class PluginLspOpts
  opts = {
    fuzzy = { implementation = "prefer_rust" },
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
