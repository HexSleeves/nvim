return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
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
