ZSH_DISABLE_COMPFIX="true"

source ~/.profile

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras vi-mode debian screen history extract colorize web-search docker)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#


# My Stuff: jkassis
#
# Tweak VI Mode
# https://dougblack.io/words/zsh-vi-mode.html
export KEYTIMEOUT=1

# DIRECTORY NAVIGATION
# Go up the directory tree
alias 'cd.'='cd ..'
alias 'cd..'='cd ../..'
alias 'cd...'='cd ../../..'
alias 'cd....'='cd ../../../..'

# Directory stack navigation
alias cdi='pushd'   # "go in" — push current dir to stack
alias cdo='popd'    # "go out" — pop back to previous dir
alias cdls='dirs -v'  # List directory stack with indices

# Common locations
alias cdh='cd ~'              # Home
alias cdH='cd ~/Home'
alias cdt='cd /tmp'           # Temp
alias cdd='cd ~/Downloads'    # Downloads
alias cdp='cd ~/Projects'     # Projects
alias cdw='cd ~/workspace'    # Workspace
alias cdc='cd ~/Code'    # Code
alias cdcfg='cd ~/.config'    # Config

# zoxide or autojump support (optional)
# Uncomment if using zoxide
# alias g='z'
# alias ga='z -'

# Custom bookmarks (adjust to your environment)
# alias gsrc='cd ~/src/github.com/yourname'


# EDITOR
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'    # For remote sessions
else
  export EDITOR='nvim'   # For local sessions
fi


# pathadd adds arguments to the PATH env var
pathadd() {
  newelement=${1%/}
  if [ ! -d "$1" ] ; then
    # echo " PATHADD SKIPPED:   $1 (does not exist)"
    return 1
  fi
  if ! echo $PATH | grep -E -q "(^|:)$newelement($|:)" ; then
    if [ "$2" = "after" ] ; then
      # echo " PATHADD APPENDED:  $1"
      export PATH="$PATH:$newelement"
    else
      # echo " PATHADD PREPENDED: $1"
      export PATH="$newelement:$PATH"
    fi
  else
    echo " PATHADD SKIPPED:   $1 (already in path)"
  fi
}

# pathrm removes arguments from the PATH env var
pathrm() {
  export PATH="$(echo $PATH | sed -e "s;\(^\|:\)${1%/}\(:\|\$\);\1\2;g" -e 's;^:\|:$;;g' -e 's;::;:;g')"
}

# any local machine config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# use gvm for the GOPATH
[[ -s "/home/jkassis/.gvm/scripts/gvm" ]] && source "/home/jkassis/.gvm/scripts/gvm"

export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

[[ -s "/Users/jkassis/.gvm/scripts/gvm" ]] && source "/Users/jkassis/.gvm/scripts/gvm"
export GPG_TTY=$(tty)

[[ -s "/Users/l1jxk15/.gvm/scripts/gvm" ]] && source "/Users/l1jxk15/.gvm/scripts/gvm"
