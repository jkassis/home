# Say hello
echo "Running .zshrc"

# set -e      # Exit on errors
# set -v     # Verbose output


# Set terminal
export TERM=xterm-256color

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Basic Aliases
alias c=clear
#alias rm='safe-rm'


# PATH MANIPULATION FUNCTIONS
pathadd() {
  newelement=${1%/}
  if [ ! -d "$1" ] ; then
    echo " PATHADD SKIPPED:   $1 (does not exist)"
    return 1
  fi
  if ! echo $PATH | grep -E -q "(^|:)$newelement($|:)" ; then
    if [ "$2" = "after" ] ; then
      echo " PATHADD APPENDED:  $1"
      export PATH="$PATH:$newelement"
    else
      echo " PATHADD PREPENDED: $1"
      export PATH="$newelement:$PATH"
    fi
  else
    echo " PATHADD SKIPPED:   $1 (already in path)"
  fi
}

pathrm() {
  export PATH="$(echo $PATH | sed -e "s;\(^\|:\)${1%/}\(:\|\$\);\1\2;g" -e 's;^:\|:$;;g' -e 's;::;:;g')"
}



# PROFILE BINARIES (Checked in)
pathadd "$HOME/home/bin"

# PROFILE BINARIES (Local)
pathadd "$HOME/bin"


# POWERLEVEL STATUS LINE
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"

# PL TEXT / GLYPH MODE
POWERLEVEL9K_MODE='nerdfont-complete'

# PL LEFT PROMPT
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode dir vcs)

# PL RIGHT PROMPT
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs history time)

# PL VI MODE INDICATOR
POWERLEVEL9K_VI_INSERT_MODE_STRING='I'
POWERLEVEL9K_VI_COMMAND_MODE_STRING='N'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='005'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='white'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='245'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='236'

# PL TIME & STATUS
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"
POWERLEVEL9K_STATUS_VERBOSE=false

# PL NODE VERSION SEGMENT
POWERLEVEL9K_NODE_VERSION_BACKGROUND='022'

# PL SHORTENING
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_CONTEXT_TEMPLATE="%n"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git-extras heroku jira django)
plugins=(vi-mode git git-extras zsh-autosuggestions)

# Tweak VI Mode
# https://dougblack.io/words/zsh-vi-mode.html
export KEYTIMEOUT=1


# OH-MY-ZSH
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# GIT
alias gcoa="g coa"
alias gcop="g cop"
alias gdi="g di"

# i18N
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# FZF
# Use fd instead of find (honors .gitignore files)
pathadd "$HOME/.fzf/bin/" 
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# EDITOR
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'    # For remote sessions
else
  export EDITOR='nvim'   # For local sessions
fi

# LANG: C
# export ARCHFLAGS="-arch x86_64"

# LANG: GO
export GOPATH="$HOME/go"
pathadd "$GOPATH/bin"
pathadd "/usr/local/go/bin"

# LANG: RUST
pathadd "$HOME/.cargo/bin"

# SSH
# export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# POSTGRES
# list all current dbs
pathadd "/Applications/Postgres.app/Contents/Versions/latest/bin"
alias plistdb="psql -c 'select datname from pg_database where datistemplate=false;'"
pcopydb() {
  # usage: copydb (current db name) (new db name)
  createdb -O $USERNAME -T $1 $2
}
psetdb() {
  # sets current active db, tricky part is it is only for that terminal so if you have multiple open it can get fun
  export DATABASE_URL=postgresql://$USERNAME@localhost:5432/$1
}
pwhichdb() {
  # which db is currently set as my active db
  echo $DATABASE_URL
}
pdropdb() {
  psql -c "DROP DATABASE \"$1\""
}


# DOCKER
alias dockerip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"


# KUBERNETES
export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config
alias kc='kubectl'
alias kcl='kubectl logs -f'
alias kcex='kubectl exec -it '
alias kcdel='kubectl delete'
alias kcdes='kubectl describe'
alias kcg='kubectl get'
alias kced='kubectl edit'
alias kcgev='kubectl get events --sort-by=.metadata.creationTimestamp'
alias kct='kubectl run toolbox --rm -i --tty --image jkassis/nettools:latest -- bash'
if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi


# HELM
if [ $commands[helm] ]; then source <(helm completion zsh); fi


# PERFORCE
export P4CONFIG=.p4config


# LOCAL CONF
source $HOME/.zshrc.local


