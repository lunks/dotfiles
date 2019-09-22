#!/bin/sh

REPOSRC="https://github.com/tmux-plugins/tpm"
LOCALREPO="$HOME/.tmux/plugins/tpm"

LOCALREPO_VC_DIR=$LOCALREPO/.git

if [ ! -d $LOCALREPO_VC_DIR ]
then
    git clone $REPOSRC $LOCALREPO
fi

# End
