# LANG
# export LANGUAGE=en_US:zh_CN
# export LANGUAGE=zh_CN:en_US
# export LANGUAGE=en_US
# export LC_MESSAGES=zh_CN.UTF-8


export EDITOR=nvim
# export PAGER=sioyek
# export TERMINAL=kitty
# export TERM=kitty

# Shell opt
# The meaning of these options can be found in man page of `zshoptions`.
export HISTSIZE=1000
export SAVEHIST=1000
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time
# export SUDO_ASKPASS="$HOME/.local/bin/rpass"

# Dir
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export W3M_DIR="$XDG_DATA_HOME"/w3m
# export XDG_RUNTIME_DIR="$HOME/.local/tmp"

# export XDG_CURRENT_DESKTOP="GTK"
# export GTK_USE_PORTAL=1

# File
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# X
export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
# export DISPLAY=":0"

# export HOME_IP_5G="2408:8207:1962:6500:bf23:f89a:d169:3449"
# export HOME_IP="2408:8207:1962:6500:87c2:38e5:1717:8420"

# Software
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GOPROXY=goproxy.io
export GOPATH="$HOME"/.local/opt/go
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
# PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
# export WECHAT_DATA_DIR="$HOME/Desktop/WeChat_Data"
# export _ZL_DATA="$XDG_DATA_HOME/zlua"
# export UNISON="$XDG_CONFIG_HOME/unison"
# export UNISON="$XDG_DATA_HOME/unison"

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

# PATH
# export PATH="$GOPATH/bin:$PATH"
# export PATH="$HOME/.local/opt/npm/bin:$PATH"
# export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
# export PATH="/home/hiraeth/.local/stewbin:$PATH"
#
typeset -U path
path=(
    "$HOME/.local/bin"
    "$HOME/.local/share/npm/bin"
    "$GOPATH/bin"
    $path
)
export PATH
