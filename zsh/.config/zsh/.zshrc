# zmodload zsh/zprof

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

bindkey -v
# source
source $HOME/.config/zsh/alias

# plugins
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh  # Replace zsh's default completion selection menu with fzf
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh # a little bit faster, as is said
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh # completion offered after the cursor in a muted gray color, by history
# source <(fzf --zsh) # CTRL-T CTRL-R ALT-C and ** trigger

# theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme # promot theme
# eval "$(starship init zsh)"

# eval $(thefuck --alias f)
eval "$(zoxide init zsh)"
eval "$(gh copilot alias -- zsh)"
# Bind ctrl-r but not up arrow
eval "$(atuin init zsh --disable-up-arrow)"
# eval "$(atuin init zsh --disable-ctrl-r)"

# carapace completion
# export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
# zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
# zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'
# source <(carapace _carapace)

# source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh # completion, wired
# zstyle ':autocomplete:*' min-input 3
# bindkey '^I'   menu-complete
# bindkey '^[[Z' reverse-menu-complete

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

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


# The following lines were added by compinstall
# zstyle :compinstall filename '/home/hiraeth/.zshrc'

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION" 
# End of lines added by compinstall

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# use directory as name of terminal
precmd () {print -Pn "\e]0;%~\a"}

# uncomment the first line and the following, then use `PROFILE_STARTUP=true zsh` to show start time
# if [[ "$PROFILE_STARTUP" == true ]]; then
#   zprof
# fi
