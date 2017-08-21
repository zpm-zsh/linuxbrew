local function export_env() {
  local brew_prefix="$1"
  export PATH="$brew_prefix/sbin:$brew_prefix/bin:$PATH"
  export MANPATH="$brew_prefix/share/man:$MANPATH"
  export INFOPATH="$brew_prefix/share/info:$INFOPATH"
  export XDG_DATA_DIRS="$brew_prefix/share:$XDG_DATA_DIRS"
  fpath=( "$brew_prefix/completions/zsh" $fpath )
}

local HOME_PREFIX="$HOME/.linuxbrew"
local RECOMMENDED_PREFIX="/home/linuxbrew/.linuxbrew"


export_env $HOME_PREFIX
export_env $RECOMMENDED_PREFIX

if (( ! $+commands[brew] )); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  if [[ ! $? -eq 0 ]]; then
      printf 'recommended install failed. try just cloning git repo? '
      if read -q; then
          echo; git clone https://github.com/Linuxbrew/brew "$HOME_PREFIX" </dev/null >/dev/null 2>/dev/null &!
      fi
  fi
fi
