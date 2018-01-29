# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/daanvdk/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(osx spotify tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

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
DEFAULT_USER="daanvdk"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export VIRTUAL_ENV_DISABLE_PROMPT=true
export ZLE_RPROMPT_INDENT=0

ZSH_COLOR_PRIMARY=38
ZSH_COLOR_SECONDARY=24

prompt_segment() {
  local STYLE_A STYLE_B
  STYLE_A="%{\e[48;5;$1m\e[38;5;$2m%}"
  STYLE_B="%{\e[48;5;$3m\e[38;5;$1m%}"
  echo "${STYLE_A}$4${STYLE_B}"
}

prompt_segment_end() {
  local STYLE_A STYLE_B
  STYLE_A="%{\e[48;5;$1m\e[38;5;$2m%}"
  STYLE_B="%{\e[m\e[38;5;$1m%}"
  echo "${STYLE_A}$3${STYLE_B}%{\e[0m%}"
}

rprompt_segment() {
  local STYLE_A STYLE_B
  STYLE_A="%{\e[48;5;$1m\e[38;5;$2m%}"
  STYLE_B="%{\e[38;5;$1m%}"
  echo "${STYLE_B}${STYLE_A}$3"
}

rprompt_end() {
  # echo "%{\e[0m%}"
}

prompt_venv() {
  if [[ -n $VIRTUAL_ENV ]]; then
    prompt_segment $ZSH_COLOR_SECONDARY 255 $ZSH_COLOR_PRIMARY "%{\e[1m%} `basename $VIRTUAL_ENV` %{\e[0m%}"
  fi
}

prompt_user() {
  prompt_segment $ZSH_COLOR_PRIMARY $ZSH_COLOR_SECONDARY 239 "%{\e[1m%} %n %{\e[0m%}"
}

prompt_path() {
  local DISPLAY_PATH SEPERATOR
  SEPERATOR=" %{\e[38;5;235m%}%{\e[38;5;255m%} "
  DISPLAY_PATH="${PWD/#$HOME/~}"
  DISPLAY_PATH="${DISPLAY_PATH/#\//}"
  DISPLAY_PATH="${DISPLAY_PATH//\//$SEPERATOR}"
  prompt_segment_end 239 255 " $DISPLAY_PATH "
}

prompt_git() {
  local BRANCH COLOR
  BRANCH="$(git symbolic-ref HEAD 2>/dev/null)"
  if [[ -n $BRANCH ]]; then
    BRANCH=${BRANCH##refs/heads/}
    BRANCH=${BRANCH:-HEAD}
    eval "git diff-index --quiet HEAD --"
    [[ $? -ne 0 ]] && COLOR=136 || COLOR=64
    rprompt_segment 234 $COLOR "  $BRANCH$CHANGES "
  fi
}

prompt_result() {
  if [[ $1 -ne 0 ]]; then
    rprompt_segment 124 211 " $1 "
  fi 
}

build_prompt() {
  echo "$(prompt_venv)$(prompt_user)$(prompt_path) "
}

build_rprompt() {
  local RES
  RES="$(prompt_git)"
  if [[ -n $RES ]]; then
    RES+="%{\e[0m%}"
  fi
  echo $RES
}

setopt prompt_subst

PROMPT='$(build_prompt)'
RPROMPT='$(build_rprompt)'
