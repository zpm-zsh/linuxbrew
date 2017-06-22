local BREW_PREFIX="$HOME/.linuxbrew"

if [[ ! -d "$BREW_PREFIX" ]]; then
  git clone https://github.com/Linuxbrew/brew "$BREW_PREFIX" </dev/null >/dev/null 2>/dev/null &!
fi

if [[ -d "$BREW_PREFIX" ]]; then
  if [[ ":$PATH:" != *":$BREW_PREFIX/sbin:"* ]]; then
    export PATH="$BREW_PREFIX/sbin:$BREW_PREFIX/bin:$PATH"
    export MANPATH="$BREW_PREFIX/share/man:$MANPATH"
    export INFOPATH="$BREW_PREFIX/share/info:$INFOPATH"
    export XDG_DATA_DIRS="$BREW_PREFIX/share:$XDG_DATA_DIRS"
  fi
    fpath=( "$BREW_PREFIX/completions/zsh" $fpath )
fi
