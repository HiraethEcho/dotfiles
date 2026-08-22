# zmodload zsh/zprof

# =========================================================
# History — must be here (interactive only), NOT .zprofile,
# so non-login shells get history too
# =========================================================
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

# =========================================================
# Shell behaviour
# =========================================================
setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT  # sort file10 after file9, not after file1

# =========================================================
# Modules
# =========================================================
source "$ZDOTDIR/completion.zsh"
source "$ZDOTDIR/keybindings.zsh"
source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/functions.zsh"
source "$ZDOTDIR/fzf.zsh"
source "$ZDOTDIR/plugins.zsh"
# source "$ZDOTDIR/lean.zsh"

# uncomment the first line and the following, then use `PROFILE_STARTUP=true zsh` to show start time
# if [[ "$PROFILE_STARTUP" == true ]]; then
#   zprof
# fi
# vim: set commentstring=#\ %s:
