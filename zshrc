# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# set colors
export TERM="xterm-256color" # This sets up colors properly

# set shell
export SHELL=$(which zsh)

ZSH_DISABLE_COMPFIX=true
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8

source $ZSH/oh-my-zsh.sh
source $ZSH/antigen.zsh

# Initialize antigen
antigen init $HOME/.antigenrc

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

