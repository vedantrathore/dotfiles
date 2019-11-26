# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/vedantrathore/.oh-my-zsh

# set colors
export TERM="xterm-256color" # This sets up colors properly

# set shell
export SHELL=$(which zsh)

ZSH_DISABLE_COMPFIX=true

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Spaceship settings
SPACESHIP_PROMPT_ORDER=(
    time
    user
    host
    dir
    git
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
SPACESHIP_USER_COLOR="010"
SPACESHIP_HOST_COLOR="011"
SPACESHIP_DIR_COLOR="013"
SPACESHIP_GIT_BRANCH_COLOR="014"


# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    python 
    zsh-syntax-highlighting
    zsh-autosuggestions
    docker
    osx
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

for file in ~/.{exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

fpath=($fpath "/root/.zfunctions")
