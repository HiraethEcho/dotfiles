# zmodload zsh/zprof

bindkey -v

# =========================================================
# Completion
# =========================================================

fpath=("$HOME/.config/zsh/completions" $fpath)
# Load completion system
autoload -Uz compinit
# Initialize completion with cached metadata file
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION" 
# Enable interactive completion menu selection
zstyle ':completion:*' menu select
# Make completion case-insensitive
# Example: "doc" can complete to "Documents"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # lowercase input matches upper and lower

# source
source $HOME/.config/zsh/alias.zsh
source $HOME/.config/zsh/plugins.zsh
source $HOME/.config/zsh/fzf.zsh
# source $HOME/.config/zsh/lean-zsh


# double tap Esc to add sudo
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    elif [[ $BUFFER == $EDITOR\ * ]]; then
        LBUFFER="${LBUFFER#$EDITOR }"
        LBUFFER="sudoedit $LBUFFER"
    elif [[ $BUFFER == sudoedit\ * ]]; then
        LBUFFER="${LBUFFER#sudoedit }"
        LBUFFER="$EDITOR $LBUFFER"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}
zle -N sudo-command-line
bindkey "\e\e" sudo-command-line

function r() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}



# use directory as name of terminal
precmd () {print -Pn "\e]0;%~\a"}

# uncomment the first line and the following, then use `PROFILE_STARTUP=true zsh` to show start time
# if [[ "$PROFILE_STARTUP" == true ]]; then
#   zprof
# fi
# vim: set commentstring=#\ %s:
