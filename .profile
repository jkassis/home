# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi
. "$HOME/.cargo/env"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/go/bin" ] ; then
    PATH="$HOME/go/bin:$PATH"
fi

# set PATH so it includes /snap/bin if it exists
if [ -d "/snap/bin" ] ; then
    PATH="$PATH:/snap/bin"
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
[[ -s "/home/jkassis/.gvm/scripts/gvm" ]] && source "/home/jkassis/.gvm/scripts/gvm"

