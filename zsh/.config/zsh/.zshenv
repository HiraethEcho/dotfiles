# export LANGUAGE=en_US:zh_CN
# export LANGUAGE=zh_CN:en_US
# export LANGUAGE=en_US
# export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
# export PATH="$HOME/.local/share/npm/bin:$PATH"
# export PATH="$HOME/.config/dwm/dwm_functions:$HOME/.local/bin:$PATH"  
# export PATH="/home/hiraeth/.local/stewbin:$PATH"

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

export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPROXY=goproxy.io
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
# PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

export WECHAT_DATA_DIR="$HOME/Desktop/WeChat_Data"
export W3M_DIR="$XDG_DATA_HOME"/w3m
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
# export _ZL_DATA="$XDG_DATA_HOME/zlua"
# export UNISON="$XDG_CONFIG_HOME/unison"
# export UNISON="$XDG_DATA_HOME/unison"

# The meaning of these options can be found in man page of `zshoptions`.
export HISTSIZE=1000
export SAVEHIST=1000
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time
export HISTFILE="$XDG_STATE_HOME/zsh/history"

# export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'  --height 60% --reverse --border"
# export FZF_DEFAULT_OPTS=" --height 60% --reverse --border"
  # --header-label ' File Type ' \
  # --bind 'focus:+transform-header:file --brief {} || echo \"No file selected\"' \
export FZF_DEFAULT_OPTS="--reverse --style full \
  --border --padding 0,0 \
  --border-label ' fzf ' \
  --input-label ' Input ' \
  --bind=ctrl-d:preview-down,ctrl-u:preview-up \
  --color 'border:#aaaaaa,label:#cccccc' \
  --color 'preview-border:#9999cc,preview-label:#ccccff' \
  --color 'list-border:#669966,list-label:#99cc99' \
  --color 'input-border:#996666,input-label:#ffcccc' \
  --color 'header-border:#6699cc,header-label:#99ccff'
"
# export FZF_COMPLETION_OPTS='--border --info=inline'
# export FZF_COMPLETION_TRIGGER='~~'

# export LFS=/mnt/lfs
# export DEBIAN_IP="2408:8207:1962:6500:4035:dc4c:6be9:6ad1"
export DEBIAN_IP="2408:8207:1962:6500:a71:90ff:fe3d:a08b"
# export WIN_IP="2408:8207:1963:c5d0:f13c:21b5:d2c8:62b7"
export ALIECS_IP="120.26.223.0"
export ALILIGHT_IP="182.92.134.43"
