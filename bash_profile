#!/bin/bash

export PATH="$(du "$HOME/.scripts" | cut -f2 | grep -iv ".git" | tr '\n' ':' | sed 's/\(.*\)./\1/'):$PATH"
export EDITOR="vim"


