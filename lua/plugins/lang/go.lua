return {
  "neovim/nvim-lspconfig",
  lazy = true,
  ft = "go",
  ---@class PluginLspOpts
  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = {
            buildFlags = { "-tags=sdl" },
          },
        },
      },
    },
  },
}
