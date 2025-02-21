# export LANGUAGE=en_US:zh_CN
# export LANGUAGE=zh_CN:en_US
# export LANGUAGE=en_US
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
# export PATH="$HOME/.config/dwm/dwm_functions:$HOME/.local/bin:$PATH"  
# PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export EDITOR=nvim
# export PAGER=sioyek
# export SUDO_ASKPASS="$HOME/.local/bin/rpass"
# export TERMINAL=kitty
# export TERM=kitty


export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
# export XDG_RUNTIME_DIR="$HOME/.local/tmp"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
# export _ZL_DATA="$XDG_DATA_HOME/zlua"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export GOPROXY=goproxy.io
# export UNISON="$XDG_CONFIG_HOME/unison"
# export UNISON="$XDG_DATA_HOME/unison"
export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export W3M_DIR="$XDG_DATA_HOME"/w3m
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# The meaning of these options can be found in man page of `zshoptions`.
export HISTSIZE=1000
export SAVEHIST=1000
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

# export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'  --height 60% --reverse --border"
# export FZF_DEFAULT_OPTS=" --height 60% --reverse --border"
export FZF_DEFAULT_OPTS="--reverse --border --bind=ctrl-d:preview-down,ctrl-u:preview-up --preview 'bat {}'"
export FZF_COMPLETION_OPTS='--border --info=inline'
# export FZF_COMPLETION_TRIGGER='~~'

# export LFS=/mnt/lfs
