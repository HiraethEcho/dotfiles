# =========================================================
# Functions
# =========================================================

function r() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# use directory as name of terminal
# add-zsh-hook (not plain precmd) so starship's precmd_functions also runs
# NOTE: hook entries are function NAMES — strings trigger autoload lookup
set-term-title() { print -Pn "\e]0;%~\a" }
autoload -Uz add-zsh-hook
add-zsh-hook precmd set-term-title
