-- Reenable once complete
-- https://github.com/LazyVim/LazyVim/pull/6183/files#diff-dab4dc74d913bee135e152f450f79ce838e492b714fb02cb066b09b1283fec0a

if true then
  return {}
end

return {
  "saghen/blink.cmp",
  -- build = "cargo build --release",
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
