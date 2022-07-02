# Say hello
echo "Running .config/fish/config.fish"

set -x fish_prompt_pwd_dir_length 2
function fish_right_prompt -d "Write out the right prompt"
    date '+%m.%d %H:%M'
end

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
set -U fish_cursor_default block
set -U fish_cursor_insert line
set -U fish_cursor_replace_one underscore
set -U fish_cursor_visual block
fish_vi_key_bindings


# Set terminal
export TERM=xterm-256color


# ALIASES : BASIC
alias c=clear
#alias rm='safe-rm'


# BREW
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
set -q PATH; or set PATH ''; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;


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

# LANG: PYTHON
alias python=python3
alias pip=pip3

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

# use direnv
#direnv hook fish | source

echo PATH is $PATH

source ~/.config/fish/config.fish.local
