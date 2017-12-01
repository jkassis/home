# OPT PACKAGES
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# PYTHON
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# GIT
#export PATH="/usr/local/git/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH"

# POSTGRESS
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# GO
export GOPATH="$HOME/Projects/go"
export PATH="/usr/local/go/bin:$PATH"

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
plugins=(git git-extras virtualenvwrapper zsh-autosuggestions)

# Fire it up
source $ZSH/oh-my-zsh.sh

# START HERE
cd .

# LANGUAGE
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# EDITOR
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# C LANG
# export ARCHFLAGS="-arch x86_64"

# SSH
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# BETTERWORKS
alias wb="cd $HOME/Code/BetterWorks"
alias es="wb; cd ../elasticsearch; ./es.sh"

# GIT
alias gac="git add . && git commit"
alias gmu="git fetch upstream && git merge upstream/master"
alias gru="git pull -r upstream master"
alias gpo="git push --set-upstream origin \`git symbolic-ref --short HEAD\`"
alias gbd="git branch -D "
alias gpf="git push --force-with-lease"
alias gd="git diff --minimal -w HEAD | cdiff -s -w 100"
alias gs='git status'
alias gc='git commit'

# PYTHON
alias f8="ls -1 -d */ | xargs -n 2 -P 8 flake8 -j 1"
alias is="find . -name \"*.py\" -not -name appfiles | xargs -n 400 -P 8 isort -q"
alias tt="py.test -s"

# ELASTIC SEARCH
bindkey "^R" history-incremental-pattern-search-backward

# POSTGRES
# list all current dbs
alias listdb="psql -c 'select datname from pg_database where datistemplate=false;'"

# usage: copydb (current db name) (new db name)
copydb() {
  createdb -O $USERNAME -T $1 $2
}

# sets current active db, tricky part is it is only for that terminal so if you have multiple open it can get fun
setdb() {
  export DATABASE_URL=postgresql://$USERNAME@localhost:5432/$1
}

# which db is currently set as my active db
whichdb() {
  echo $DATABASE_URL
}

dropdb() {
  psql -c "DROP DATABASE \"$1\""
}

# JAVA
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk/Contents/Home

# CIRCLECI
#CIRCLE_TEST_REPORTS=/tmp
#export CIRCLE_TEST_REPORTS

# As per... https://betterworks.atlassian.net/wiki/spaces/QA/pages/45056063/Testing+Internet+Explorer+with+Localhost+server
export ENABLE_TEST_HOOKS=0000000000
