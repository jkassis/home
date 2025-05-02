
###########################################################################
# allow $USER to use keys. Only enter once and it will remain enabled till
# you delete it or reboot the server 
###########################################################################
echo To cache your ssh password... run
echo /usr/bin/keychain $HOME/.ssh/id_rsa
source $HOME/.keychain/$HOSTNAME-sh
. "$HOME/.cargo/env"
