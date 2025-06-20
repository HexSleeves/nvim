# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a highly customized LazyVim configuration for Neovim, optimized for AI-assisted development. The configuration is built on top of LazyVim and focuses heavily on AI coding tools and modern development workflows.

## Architecture

- **Base Framework**: LazyVim configuration with Lazy.nvim plugin manager
- **Entry Point**: `init.lua` bootstraps the entire configuration via `config/lazy.lua`
- **Configuration Structure**:
  - `lua/config/` - Core LazyVim configuration (options, keymaps, autocmds)
  - `lua/plugins/` - Individual plugin configurations
  - `lua/utils/` - Utility functions

## Key AI Tools Integration

The configuration centers around three main AI coding assistants:

1. **Avante.nvim** (`lua/plugins/avante.lua`)
   - Primary AI assistant with keybindings under `<Leader>A` prefix
   - Key mappings: `<Leader>A<CR>` (ask), `<Leader>Ae` (edit), `<Leader>At` (toggle)
   - Requires `make` command to build from source

2. **Aider.nvim** (`lua/plugins/aider.lua`)
   - Auto-manages buffer context
   - Uses default `<Leader>A` keybindings (may conflict with Avante)

3. **CodeCompanion.nvim** (`lua/plugins/codecompanion/`)
   - Includes custom fidget spinner integration
   - Depends on Plenary, Treesitter, and Fidget

## Language-Specific Configuration

### Go Development
- **File**: `lua/plugins/go.lua`
- **Special Configuration**: `gopls` LSP configured with SDL build flags (`-tags=sdl`)
- This suggests the configuration is optimized for Go projects using SDL bindings

## Development Commands

### Code Formatting
```bash
# Format Lua code (uses stylua.toml configuration)
stylua lua/
```

### Plugin Management
```bash
# Launch Neovim - plugins auto-install on first run
nvim

# Update plugins (from within Neovim)
:Lazy update

# Check plugin status
:Lazy
```

## Configuration Management

- **Plugin Loading**: All custom plugins load during startup (lazy = false by default)
- **Updates**: Automatic update checking enabled but notifications disabled
- **Performance**: Several default Neovim plugins disabled for performance

## Important Files

- `init.lua` - Entry point
- `lua/config/lazy.lua` - Plugin manager setup and performance optimizations  
- `lazy-lock.json` - Plugin version lockfile
- `stylua.toml` - Lua formatting configuration (2 spaces, 120 column width)

## Special Considerations

- The configuration uses multiple AI tools that may have overlapping keybindings
- Avante.nvim requires compilation with `make BUILD_FROM_SOURCE=true` if building from source
- Go development includes SDL-specific build flags
- The setup prioritizes AI-assisted development workflows over traditional Vim patterns