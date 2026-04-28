-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.guicursor = "i:block-blinkwait1000-blinkon500-blinkoff500"
vim.g.lazyvim_blink_main = true
vim.g.lazyvim_picker = "snacks"

-- Skip language providers we don't use (silences :checkhealth warnings).
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
