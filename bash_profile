#!/bin/bash

export PATH="$(du "$HOME/.scripts" | cut -f2 | grep -iv ".git" | tr '\n' ':' | sed 's/\(.*\)./\1/'):$PATH"
export EDITOR="vim"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
