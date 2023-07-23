# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/tools/flutter/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# set colors
export TERM="xterm-256color" # This sets up colors properly

# set shell
export SHELL=$(which zsh)

export ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh
source $ZSH/antigen.zsh

# Initialize antigen
antigen init $HOME/.antigenrc

# Spaceship prompt settings
SPACESHIP_PROMPT_ORDER=(
    venv
    user
    host
    dir
    git
    docker
    aws
    exit_code
    line_sep
    vi_mode
    char
)
SPACESHIP_USER_SHOW="always"
SPACESHIP_HOST_SHOW="always"
SPACESHIP_PROMPT_ADD_NEWLINE="false"
SPACESHIP_PROMPT_SEPARATE_LINE="true"
SPACESHIP_USER_PREFIX=" "
SPACESHIP_USER_SUFFIX=""
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_DIR_TRUNC_REPO="false"
SPACESHIP_DIR_TRUNC_PREFIX=".../"
SPACESHIP_GIT_STATUS_PREFIX=""
SPACESHIP_GIT_STATUS_SUFFIX=""
SPACESHIP_GIT_STATUS_MODIFIED="**"
SPACESHIP_GIT_STATUS_UNMERGED="!"
SPACESHIP_GIT_STATUS_UNTRACKED=""
SPACESHIP_GIT_STATUS_ADDED="*"
SPACESHIP_GIT_STATUS_RENAMED=""
SPACESHIP_GIT_STATUS_DELETED=""
SPACESHIP_GIT_STATUS_STASHED=""
SPACESHIP_GIT_STATUS_DIVERGED=""

# Spaceship colors
SPACESHIP_USER_COLOR="046"
SPACESHIP_HOST_COLOR="226"
SPACESHIP_GIT_BRANCH_COLOR="045"

HIST_STAMPS="dd/mm/yyyy"

for file in ~/.{exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

export PATH="$HOME/.poetry/bin:$PATH"

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

