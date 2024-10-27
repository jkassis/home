# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.
# This file is not read by zsh, if ~/.zsh_profile or ~/.zsh_login exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022


# ~/bin
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# .local
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# cargo
if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi
. "$HOME/.cargo/env" # setup cargo env

# golang
if [ -d "$HOME/go/bin" ] ; then
    PATH="$HOME/go/bin:$PATH"
fi

#snap
if [ -d "/snap/bin" ] ; then
    PATH="$PATH:/snap/bin"
fi

# yarn
if [ -d "$HOME/.yarn/bin" ] ; then
    PATH="$PATH:$HOME/.yarn/bin"
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
if [ -n "$BASH_VERSION" ]; then
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# infra aliases
alias kc="/opt/homebrew/bin/kubectl"
alias kx="/opt/homebrew/bin/kubectx"
alias kns="/opt/homebrew/bin/kubens"
alias tg="/opt/homebrew/bin/terragrunt"
alias tf="/opt/homebrew/bin/terraform"

# misc aliases
alias c="clear"
alias y="yarn"

# setup gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"


# swap caps and esc
#setxkbmap -option caps:swapescape
alias clip="xclip -selection clipboard"

