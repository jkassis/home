# Say hello
echo "Running .config/fish/config.fish"


# PATH Setup
# Function for cleaning up duplicates
function pathadd
  for i in $argv
      if not contains $i $PATH
          # echo Adding $i to PATH
          set PATH $PATH $i
      # else
      #     echo PATH already contains $i
      end
  end
end

pathadd "$HOME/bin" "$HOME/home/bin"

# Use VI Mode
fish_vi_key_bindings

# Set terminal
export TERM=xterm-256color


# ALIASES : BASIC
alias c=clear
#alias rm='safe-rm'


# GIT
source $HOME/.config/fish/git.aliases

# i18N
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# FZF
# Use fd instead of find (honors .gitignore files)
pathadd "$HOME/.fzf/bin/"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# LANG: C
# export ARCHFLAGS="-arch x86_64"

# LANG: GO
set -gx GOPATH "$HOME/go" $GOPATH
pathadd "$GOPATH/bin" "/usr/local/go/bin"

# LANG: RUST
pathadd "$HOME/.cargo/bin"

# SSH
# set -gx SSH_KEY_PATH="$HOME/.ssh/rsa_id"


# DOCKER
alias dockerip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
# alias docker=podman


# KUBERNETES
set -gx KUBECONFIG "$KUBECONFIG:$HOME/.kube/config"
alias kc='kubectl'
alias kcl='kubectl logs -f'
alias kcex='kubectl exec -it '
alias kcdel='kubectl delete'
alias kcdes='kubectl describe'
alias kcg='kubectl get'
alias kced='kubectl edit'
alias kcgev='kubectl get events --sort-by=.metadata.creationTimestamp'
alias kct='kubectl run toolbox --rm -i --tty --image jkassis/nettools:latest -- bash'


# PERFORCE
set -gx P4CONFIG .p4config


# LOCAL CONF
source $HOME/.config/fish/config.local.fish

# echo PATH is $PATH
