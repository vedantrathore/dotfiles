#!/bin/zsh
# .zshrc - Zsh file loaded on interactive shell sessions.

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=$HOME/bin:/usr/local/bin:${KREW_ROOT:-$HOME/.krew}/bin:/Users/vedantrathore/Library/Python/3.13/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# set colors
export TERM="xterm-256color" # This sets up colors properly

# set shell
export SHELL=$(which zsh)

function is-macos() {
  [[ $OSTYPE == darwin* ]]
}

# Initialize antidote
source $HOME/.dotfiles/vendor/github/antidote/antidote.zsh
antidote load 

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
HIST_STAMPS="dd/mm/yyyy"
setopt appendhistory
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

for file in ~/.{exports,aliases,functions,p10k.zsh}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Zsh options.
setopt extended_glob
autoload -Uz compinit && compinit -C  # -C skips security check for faster startup
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --group-directories-first --icons $realpath'
zstyle ':fzf-tab:complete:__zxoide_z:*' fzf-preview 'eza -1 --color=always --group-directories-first --icons $realpath'

eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"  # Better shell history (Ctrl+r)
eval "$(navi widget zsh)" # Cheatsheet widget (Ctrl+g)
zvm_after_init_commands+=('source <(fzf --zsh)')

# Keybindings for productivity (must run after zsh-vi-mode init)
zvm_after_init_commands+=(
    'bindkey "^y" autosuggest-accept'          # Ctrl+y to accept autosuggestion
    'bindkey "^f" tmux-sessionizer-widget'     # Ctrl+f for tmux sessionizer
    'bindkey -r "^P"'                          # Unbind Ctrl+P (let tmux handle it)
    'bindkey -r "^N"'                          # Unbind Ctrl+N (let tmux handle it)
)

# Tmux sessionizer widget
tmux-sessionizer-widget() {
    ~/.local/bin/tmux-sessionizer
    zle reset-prompt
}
zle -N tmux-sessionizer-widget

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/vedantrathore/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# pnpm
export PNPM_HOME="/Users/vedantrathore/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="$PATH:/Users/vedantrathore/.local/bin"


. "$HOME/.local/bin/env"

# Added by Windsurf
export PATH="/Users/vedantrathore/.codeium/windsurf/bin:$PATH"

# Bitwarden secrets management
# Usage: Run `bw-secrets` to unlock vault and load API keys
# Set ANTHROPIC_BASE_URL in ~/.zshrc.local if needed

bw-secrets() {
  # Check if bw is installed
  if ! command -v bw &> /dev/null; then
    echo "Bitwarden CLI not installed. Install with: brew install bitwarden-cli"
    return 1
  fi

  # Check login status
  if ! bw login --check &> /dev/null; then
    echo "Not logged in. Run: bw login"
    return 1
  fi

  # Unlock if needed
  if [[ -z "$BW_SESSION" ]]; then
    echo "Unlocking Bitwarden vault..."
    export BW_SESSION=$(bw unlock --raw)
    if [[ -z "$BW_SESSION" ]]; then
      echo "Failed to unlock vault"
      return 1
    fi
  fi

  # Fetch secrets (store these in Bitwarden as Secure Notes with these names)
  echo "Fetching secrets from Bitwarden..."

  local anthropic_token=$(bw get password "ANTHROPIC_AUTH_TOKEN" 2>/dev/null)
  local perplexity_key=$(bw get password "PERPLEXITY_API_KEY" 2>/dev/null)

  if [[ -n "$anthropic_token" ]]; then
    export ANTHROPIC_AUTH_TOKEN="$anthropic_token"
    echo "✓ ANTHROPIC_AUTH_TOKEN loaded"
  else
    echo "✗ ANTHROPIC_AUTH_TOKEN not found in vault"
  fi

  if [[ -n "$perplexity_key" ]]; then
    export PERPLEXITY_API_KEY="$perplexity_key"
    echo "✓ PERPLEXITY_API_KEY loaded"
  else
    echo "✗ PERPLEXITY_API_KEY not found in vault"
  fi
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi
