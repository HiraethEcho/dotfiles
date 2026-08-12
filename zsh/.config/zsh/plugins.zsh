source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh  # Replace zsh's default completion selection menu with fzf
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh # a little bit faster, as is said
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh # completion offered after the cursor in a muted gray color, by history
# source <(fzf --zsh) # CTRL-T CTRL-R ALT-C and ** trigger
# eval $(thefuck --alias f)
eval "$(zoxide init zsh)"
# eval "$(navi widget zsh)"
# eval "$(gh copilot alias -- zsh)"
# Bind ctrl-r but not up arrow
# eval "$(atuin init zsh --disable-up-arrow)"
# eval "$(atuin init zsh --disable-ctrl-r)"

# source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh # completion, wired
# zstyle ':autocomplete:*' min-input 3
# bindkey '^I'   menu-complete
# bindkey '^[[Z' reverse-menu-complete
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"
eval "$(starship init zsh)"
