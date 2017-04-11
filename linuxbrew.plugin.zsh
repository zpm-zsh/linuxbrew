#!/usr/bin/env zsh

if [[ ! -d "$HOME/.linuxbrew" ]]; then
  git clone https://github.com/Linuxbrew/brew ~/.linuxbrew </dev/null >/dev/null 2>/dev/null &!
fi

if [[ -d "$HOME/.linuxbrew" ]]; then
  if [[ ":$PATH:" != *":${HOME}/.linuxbrew/bin:"* ]]; then
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
    fpath=( "$HOME/.linuxbrew/completions/zsh" $fpath )
  fi
fi

