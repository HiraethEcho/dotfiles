# =========================================================
# Secrets — login only, NOT in git/stow
# =========================================================
[ -f "$ZDOTDIR/ai.zsh" ] && . "$ZDOTDIR/ai.zsh"

# =========================================================
# Defaults
# =========================================================
export EDITOR=nvim
# export PAGER=sioyek
# export TERMINAL=kitty

# =========================================================
# Env — inherited by children, so login-only is enough
# =========================================================
export W3M_DIR="$XDG_DATA_HOME"/w3m
export NODE_PATH="$HOME/.local/opt/npm/lib/node_modules:$NODE_PATH"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export UV_TOOL_DIR="$HOME/.local/opt/uv"
export TYPST_PACKAGE_PATH="$HOME/.local/lib/typst/packages"
export TYPST_PACKAGE_CACHE_PATH="$HOME/.local/lib/typst/cache"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# =========================================================
# X
# =========================================================
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
