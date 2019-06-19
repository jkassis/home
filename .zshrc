# Say hello
echo "Running .zshrc"

# Set terminal
export TERM=xterm-256color


# Disable auto-setting terminal title. 
DISABLE_AUTO_TITLE="true"

# Home Bin
export PATH="$HOME/home/bin:$PATH"

# TERM IMPROVEMENTS
alias c=clear

# OPT PACKAGES
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# POSTGRESS
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# GO
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:/usr/local/go/bin:$PATH"

# FZF
export PATH="$HOME/.fzf/bin/:$PATH"

# RUST and CARGO
export PATH="$HOME/.cargo/bin:$PATH"

# OH-MY-ZSH CONFIGURATION
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"

# STATUS LINE
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs history time)
POWERLEVEL9K_VI_INSERT_MODE_STRING='I'
POWERLEVEL9K_VI_COMMAND_MODE_STRING='N'

#POWERLEVEL9K_TIME_FORMAT="%D{%H:%M %m.%d.%y}"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"
POWERLEVEL9K_STATUS_VERBOSE=false


#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_NODE_VERSION_BACKGROUND='022'

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

# function zle-line-init zle-keymap-select {
#     VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
#     RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(git_custom_status) $EPS1"
#     zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select

# fire up oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Git
alias gcoa="g coa"
alias gcop="g cop"
alias gdi="g di"

# LANGUAGE
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# FZF
# Use fd instead of find (honors .gitignore files)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# EDITOR
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# C LANG
# export ARCHFLAGS="-arch x86_64"

# SSH
# export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# POSTGRES
# list all current dbs
alias plistdb="psql -c 'select datname from pg_database where datistemplate=false;'"

# Database aliases
# usage: copydb (current db name) (new db name)
pcopydb() {
  createdb -O $USERNAME -T $1 $2
}

# sets current active db, tricky part is it is only for that terminal so if you have multiple open it can get fun
psetdb() {
  export DATABASE_URL=postgresql://$USERNAME@localhost:5432/$1
}

# which db is currently set as my active db
pwhichdb() {
  echo $DATABASE_URL
}

pdropdb() {
  psql -c "DROP DATABASE \"$1\""
}


# Docker aliases
alias dockerip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"

# Kubernetes Stuff
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
if [ $commands[helm] ]; then source <(helm completion zsh); fi

#alias rm='safe-rm'
alias c=clear

# Local Config
source $HOME/.zshrc.local

