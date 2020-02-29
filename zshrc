# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# set colors
export TERM="xterm-256color" # This sets up colors properly

# set shell
export SHELL=$(which zsh)

export ZSH_DISABLE_COMPFIX=true
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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
SPACESHIP_TIME_SHOW="true"
SPACESHIP_TIME_SUFFIX=""
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
SPACESHIP_TIME_COLOR="009"
SPACESHIP_USER_COLOR="046"
SPACESHIP_HOST_COLOR="226"
SPACESHIP_DIR_COLOR="206"
SPACESHIP_GIT_BRANCH_COLOR="045"

HIST_STAMPS="dd/mm/yyyy"

for file in ~/.{exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

if [ "$OSTYPE"="darwin15.0" ]; then
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
fi

