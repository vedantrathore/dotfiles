#!/bin/zsh
# .zshrc - Zsh file loaded on interactive shell sessions.

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv export zsh)"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv hook zsh)"

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=$HOME/bin:/usr/local/bin:${KREW_ROOT:-$HOME/.krew}/bin:$PATH

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
autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --group-directories-first --icons $realpath'
zstyle ':fzf-tab:complete:__zxoide_z:*' fzf-preview 'eza -1 --color=always --group-directories-first --icons $realpath'

eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
zvm_after_init_commands+=('source <(fzf --zsh)')

