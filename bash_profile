#!/bin/bash

export PATH="${PATH}:$(du "$HOME/.scripts" | cut -f2 | grep -iv ".git" | tr '\n' ':' | sed 's/\(.*\)./\1/')"
export EDITOR="vim"
