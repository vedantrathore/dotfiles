# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository using [Dotbot](https://github.com/anishathalye/dotbot) for symlink management. Configuration files are symlinked to their target locations (e.g., `zshrc` → `~/.zshrc`).

## Commands

```bash
# Install dotfiles (interactive)
./install

# Minimal install (zsh, git, tmux only - good for servers)
./install minimal

# Full install (everything + Homebrew packages + macOS settings)
./install full

# Setup SSH and GPG keys (interactive)
setup-keys          # Setup both SSH and GPG
setup-keys ssh      # SSH only
setup-keys gpg      # GPG only
```

## Architecture

**Symlink Management**: `install.conf.yaml` defines what gets linked where. Dotbot creates symlinks from this repo to `~/.config/` and `~/`.

**Shell Configuration**:
- `zshrc` - Main shell config, sources `exports`, `aliases`, `functions`
- `zsh_plugins.txt` - Antidote plugin list
- `p10k.zsh` - Powerlevel10k prompt config
- `~/.zshrc.local` - Machine-specific overrides (not tracked)

**Neovim Plugins** (`nvim/lua/plugins/`):
- `auto-session.lua` - Automatic session persistence per project/branch
- `codecompanion.lua` - AI-powered coding assistant (Anthropic/OpenAI)
- `avante.lua` - Cursor-like inline AI editing
- `neotest.lua` - Test runner for Go, Python, JS/TS, Rust
- `copilot.lua` - GitHub Copilot integration
- `render-markdown.lua` - Beautiful markdown rendering
- `telescope.lua` - Fuzzy finder
- `lsp.lua` - Language server support

**Key Directories**:
- `nvim/` - Neovim config (lazy.nvim based)
- `bin/` - Custom scripts (tmux-sessionizer, setup-keys)
- `claude/` - Claude Code settings and CLAUDE.md
- `ghostty/` - Ghostty terminal config
- `mise/` - Runtime version manager config
- `vendor/` - Git submodules (dotbot, antidote)

## Customization Points

- **Local zsh overrides**: Create `~/.zshrc.local` for machine-specific settings
- **Work git config**: Files in `~/work/` use conditional gitconfig include
- **SSH/GPG**: Run `setup-keys` to interactively set up keys, or copy templates from `ssh/` and `gnupg/`
- **Per-project nvim config**: Create `.nvim.lua` in project root for project-specific settings

## Quick Reference

- `keys` or `hotkeys` alias shows the cheatsheet
- Neovim leader is `<space>`
- Tmux prefix is `C-a`
- `vim` is aliased to `nvim`

## Profiling

```bash
# Profile zsh startup time
zsh-time            # Quick timing (5 runs)
zsh-profile         # Detailed profiling instructions

# Profile nvim startup time
nvim-time           # Quick timing + startup log
nvim-profile        # Opens nvim with :Lazy profile
```

## AI Tools

**Terminal**:
- `sgpt` - Shell GPT for quick queries (`sgpt "explain this"`)
- `llm` - Multi-provider LLM CLI (`llm -m claude-3 "query"`)

**Neovim**:
- `<leader>a*` - CodeCompanion chat/actions
- `<leader>i*` - Avante inline AI editing

**Claude Code**:
- Config managed in `claude/` directory
- Custom statusline shows: directory, git branch, model, k8s context
