# Home Bin
export PATH="~/Home/bin:$PATH"

# OPT PACKAGES
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# PYTHON
#export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# GIT
# Makes python 3.7 the default
#export PATH="/usr/local/git/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH"
alias python='python3'

# POSTGRESS
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# GO
export GOPATH="$HOME/Projects/go"
export PATH="$GOPATH/bin:/usr/local/go/bin:$PATH"

# OH-MY-ZSH
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

#export PATH="/usr/local/bin:$PATH"


# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
# plugins=(git-extras heroku jira django)
plugins=(git git-extras zsh-autosuggestions)

# Fire it up
source $ZSH/oh-my-zsh.sh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# LANGUAGE
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# POSTGRES
# list all current dbs
alias plistdb="psql -c 'select datname from pg_database where datistemplate=false;'"

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


# Kubernetes Stuff
export KUBECONFIG=$KUBECONFIG:~/.kube/config
alias kc='kubectl'
alias kcl='kubectl logs -f'
alias kcx='kubectl exec -it '
alias kcdd='kubectl delete'
alias kcd='kubectl describe'
alias kcg='kubectl get'
alias kce='kubectl get events --sort-by=.metadata.creationTimestamp'
if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi
if [ $commands[helm] ]; then source <(helm completion zsh); fi


# Local Config
source ~/.zshrc.local


#alias rm='safe-rm'

