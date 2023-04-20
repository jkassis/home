jkassis home
============
Machine setup scripts, dotfiles, configuration, etc.

Install this on a fresh MacOS or Linux development MM or VM.

Prerequisites
-------------
You will need git and ssh client. Copy your id_rsa and id_rsa.pub into your home folder first.

```
> mkdir ~/.ssh
> cat > ~/.ssh/id_rsa
> chown 600 ~/.ssh/id_rsa
> cat > ~/.ssh/id_rsa.pub
> chown 644 ~/.ssh/id_rsa.pub
```

or make new keys...
```
> ssh-keygen -t rsa           # make keys
```


Installation
------------
```
> cd ~
> git clone git@github.com:jkassis/home.git
> ~/home/bin/installLinks.sh
> ~/home/bin/installMac.sh
```

Inspiration
-----------
* https://github.com/harsha1306/config
* https://github.com/mgeist/dotfiles
* https://github.com/statico/dotfiles/

