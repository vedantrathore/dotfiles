# Vedant's Dotfiles

![GitHub stars](https://img.shields.io/github/stars/vedantrathore/dotfiles?style=flat-square)
![GitHub last commit](https://img.shields.io/github/last-commit/vedantrathore/dotfiles?style=flat-square)
![License](https://img.shields.io/github/license/vedantrathore/dotfiles?style=flat-square)
![macOS](https://img.shields.io/badge/macOS-Sonoma-blue?style=flat-square&logo=apple)

> A meticulously crafted development environment with Catppuccin theming, modern CLI tools, and a powerful Neovim setup.

## Screenshots

<!-- Add your terminal screenshots here -->
<!-- ![Terminal](screenshots/terminal.png) -->
<!-- ![Neovim](screenshots/neovim.png) -->

## Features

| Category | Tools | Description |
|----------|-------|-------------|
| **Shell** | Zsh + Oh-My-Zsh + Antidote | Fast shell with lazy-loaded plugins |
| **Prompt** | Powerlevel10k | Instant prompt with git status |
| **Editor** | Neovim + LSP | Full IDE experience with lazy.nvim |
| **Terminal** | Alacritty + tmux | GPU-accelerated terminal with sessions |
| **Theme** | Catppuccin Mocha | Consistent theme across all tools |
| **File Manager** | Yazi | Blazing fast TUI file manager |
| **Git** | Lazygit + diff-so-fancy | Beautiful diffs and TUI git |
| **Search** | fzf + fd + ripgrep | Lightning fast fuzzy finding |
| **Navigation** | Zoxide + Harpoon | Smart directory and file jumping |
| **History** | Atuin | Searchable shell history sync |

## Prerequisites

Before installation, ensure you have:

- [ ] macOS (tested on Sonoma) or Linux
- [ ] Git installed
- [ ] Internet connection for cloning submodules
- [ ] (Optional) [Homebrew](https://brew.sh) for package management
- [ ] (Optional) [Nerd Font](https://www.nerdfonts.com/) for icons (Fira Code recommended)

## Installation

### Quick Install (Minimal)

Core configs only (zsh, git, tmux) - perfect for servers:

```bash
git clone https://github.com/vedantrathore/dotfiles && cd dotfiles
./install minimal
```

### Full Install

Everything including Neovim, modern CLI tools, and macOS settings:

```bash
git clone https://github.com/vedantrathore/dotfiles && cd dotfiles
./install full
```

### Standard Install

Interactive installation with prompts:

```bash
git clone https://github.com/vedantrathore/dotfiles && cd dotfiles
./install
```

## Tool Stack

### Shell & Terminal

| Tool | Purpose | Config |
|------|---------|--------|
| [Zsh](https://www.zsh.org/) | Shell | `zshrc` |
| [Oh-My-Zsh](https://ohmyz.sh/) | Zsh framework | - |
| [Antidote](https://getantidote.github.io/) | Plugin manager | `zsh_plugins.txt` |
| [Powerlevel10k](https://github.com/romkatv/powerlevel10k) | Prompt | `p10k.zsh` |
| [Alacritty](https://alacritty.org/) | Terminal | `alacritty.toml` |
| [tmux](https://github.com/tmux/tmux) | Multiplexer | `tmux.conf` |

### Modern CLI Replacements

| Classic | Modern | Purpose |
|---------|--------|---------|
| `ls` | [eza](https://github.com/eza-community/eza) | File listing with icons |
| `cat` | [bat](https://github.com/sharkdp/bat) | Syntax highlighted cat |
| `find` | [fd](https://github.com/sharkdp/fd) | User-friendly find |
| `grep` | [ripgrep](https://github.com/BurntSushi/ripgrep) | Fast grep |
| `cd` | [zoxide](https://github.com/ajeetdsouza/zoxide) | Smart cd |
| `top` | [bottom](https://github.com/ClementTsang/bottom) | System monitor |
| `du` | [dust](https://github.com/bootandy/dust) | Disk usage |
| `curl` | [curlie](https://github.com/rs/curlie) | Curl with httpie syntax |

### Neovim Plugins

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configuration |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion |
| [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git decorations |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding hints |
| [harpoon](https://github.com/ThePrimeagen/harpoon) | Quick file navigation |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | File explorer |

## Directory Structure

```
dotfiles/
├── install                 # Installation script
├── install.conf.yaml       # Dotbot configuration (full)
├── install.minimal.yaml    # Dotbot configuration (minimal)
├── Brewfile               # Homebrew packages (full)
├── Brewfile.minimal       # Homebrew packages (minimal)
│
├── zshrc                  # Zsh configuration
├── zsh_plugins.txt        # Antidote plugin list
├── p10k.zsh               # Powerlevel10k config
├── exports                # Environment variables
├── aliases                # Shell aliases
├── functions              # Shell functions
│
├── gitconfig              # Git configuration
├── tmux.conf              # tmux configuration
├── alacritty.toml         # Alacritty configuration
│
├── nvim/                  # Neovim configuration
│   ├── init.lua           # Entry point
│   └── lua/
│       ├── options.lua    # Vim options
│       ├── keymaps.lua    # Key mappings
│       ├── lazy-bootstrap.lua
│       ├── lazy-plugins.lua
│       └── plugins/       # Individual plugin configs
│
├── ripgreprc              # ripgrep configuration
├── fdignore               # fd ignore patterns
│
├── ssh/                   # SSH config templates
│   └── config.template
│
├── gnupg/                 # GPG config templates
│   ├── gpg.conf.template
│   └── gpg-agent.conf.template
│
├── k9s/                   # Kubernetes dashboard
├── yazi/                  # File manager
├── atuin/                 # Shell history
│
├── cheatsheet.md          # Keyboard shortcuts reference
├── macos                  # macOS system preferences
│
└── vendor/                # Git submodules
    └── github/
        ├── dotbot/        # Dotbot installer
        └── antidote/      # Zsh plugin manager
```

## Key Bindings

See [cheatsheet.md](cheatsheet.md) for complete keyboard shortcuts.

### Quick Reference

| Key | Action |
|-----|--------|
| `Ctrl+f` | tmux-sessionizer |
| `Ctrl+r` | Atuin history search |
| `Ctrl+g` | Navi cheatsheet |
| `Ctrl+y` | Accept autosuggestion |

### Neovim Leader Keys

| Key | Action |
|-----|--------|
| `<leader>sf` | Search files |
| `<leader>sg` | Live grep |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |

## Customization

### Local Overrides

Create `~/.zshrc.local` for machine-specific configurations (not tracked in git):

```bash
# Example: Work-specific settings
export ANTHROPIC_BASE_URL="https://custom.api.endpoint"
```

### Work Git Config

The gitconfig supports conditional includes. Create `~/work/.gitconfig`:

```ini
[user]
    email = work@company.com
```

## Updating

Pull latest changes and re-run installer:

```bash
cd ~/.dotfiles
git pull
./install
```

## Troubleshooting

### Neovim Health Check

```vim
:checkhealth
```

### Reset Neovim Plugins

```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
nvim  # Lazy will reinstall
```

### Zsh Compinit Warnings

```bash
compaudit | xargs chmod g-w
```

## Acknowledgments

- [Dotbot](https://github.com/anishathalye/dotbot) - Dotfile bootstrapper
- [Catppuccin](https://github.com/catppuccin) - Consistent theming
- [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) - Neovim foundation
- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles) - macOS defaults inspiration

## License

MIT
