# 🚀 AI-Powered LazyVim Configuration

A highly customized [LazyVim](https://github.com/LazyVim/LazyVim) configuration optimized for AI-assisted development and modern coding workflows.

## ✨ Features

### 🤖 AI Development Tools

- **[Avante.nvim](https://github.com/yetone/avante.nvim)** - Advanced AI coding assistant with chat interface
- **[CodeCompanion.nvim](https://github.com/olimorris/codecompanion.nvim)** - AI pair programming companion
- **[Aider.nvim](https://github.com/joshuavial/aider.nvim)** - AI-powered code editing and refactoring

### 🛠️ Language Support

- **Go Development** - Enhanced Go support with custom build flags for SDL
- **LSP Configuration** - Optimized language server configurations
- **Treesitter** - Advanced syntax highlighting and code understanding

### 🎨 UI/UX Enhancements

- **Cursor Integration** - Seamless integration with Cursor editor
- **Diffview** - Enhanced Git diff visualization
- **Custom Keymaps** - Optimized keyboard shortcuts for productivity

## 🚀 Quick Start

1. **Prerequisites**

   ```bash
   # Ensure you have Neovim 0.9+ installed
   nvim --version
   ```

2. **Clone this configuration**

   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Install plugins**

   ```bash
   nvim
   # LazyVim will automatically install all plugins on first launch
   ```

## ⚙️ Configuration Structure

```
lua/
├── config/           # Core LazyVim configuration
│   ├── autocmds.lua  # Auto commands
│   ├── keymaps.lua   # Key mappings
│   ├── lazy.lua      # Lazy.nvim setup
│   └── options.lua   # Neovim options
├── plugins/          # Plugin configurations
│   ├── codecompanion/ # AI coding companion
│   ├── avante.lua    # AI assistant
│   ├── aider.lua     # AI code editor
│   ├── go.lua        # Go language support
│   ├── blink.lua     # Completion engine
│   └── ...
└── utils/            # Utility functions
```

## 🤖 AI Features

### Avante AI Assistant

- **Keybinding**: `<Leader>A<CR>` - Ask AI questions
- **Edit Mode**: `<Leader>Ae` - AI-powered code editing
- **Toggle**: `<Leader>At` - Toggle AI interface
- **File Management**: `<Leader>A.` - Add current file to context

### CodeCompanion

- Integrated AI pair programming
- Context-aware code suggestions
- Custom fidget spinner for visual feedback

### Aider Integration

- Automatic buffer context management
- Default `<Leader>A` keybindings
- AI-powered refactoring capabilities

## 🛠️ Language-Specific Features

### Go Development

- Custom build flags for SDL projects
- Optimized `gopls` configuration
- Enhanced debugging support

## 📝 Customization

This configuration is designed to be easily customizable. Key areas for personalization:

1. **AI Providers**: Configure your preferred AI models in `lua/plugins/avante.lua`
2. **Keymaps**: Modify shortcuts in `lua/config/keymaps.lua`
3. **Language Support**: Add new language configurations in `lua/plugins/`
4. **UI Preferences**: Adjust themes and UI elements as needed

## 🔧 Dependencies

- **Neovim** 0.9+
- **Git** (for plugin management)
- **Node.js** (for some language servers)
- **Go** (if using Go development features)
- **Make** (for building Avante.nvim)

## 📚 Resources

- [LazyVim Documentation](https://lazyvim.github.io/)
- [Avante.nvim Guide](https://github.com/yetone/avante.nvim)
- [CodeCompanion Documentation](https://github.com/olimorris/codecompanion.nvim)

## 🤝 Contributing

Feel free to fork this configuration and adapt it to your needs. If you have improvements or suggestions, contributions are welcome!

## 📄 License

This configuration is based on LazyVim and follows the same licensing terms. See [LICENSE](LICENSE) for details.

---

_Built with ❤️ for AI-powered development_
