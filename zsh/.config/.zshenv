# =========================================================
# XDG base dirs — needed in EVERY zsh (incl. non-login, scripts)
# =========================================================
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# =========================================================
# Tool home dirs — PATH depends on these, so they live here
# =========================================================
export CARGO_HOME="$HOME/.local/opt/cargo"
export GOPATH="$HOME/.local/opt/go"
export NPM_CONFIG_PREFIX="$HOME/.local/opt/npm"
export PNPM_HOME="$HOME/.local/opt/pnpm"
export BUN_INSTALL="$HOME/.local/opt/bun"

# =========================================================
# PATH (array, deduped)
# =========================================================
typeset -U path
path=(
    "$HOME/.local/bin"
    "$HOME/.local/opt/stew/bin"
    "$HOME/.local/opt/npm/bin"
    "$HOME/.local/opt/pnpm/bin"
    "$GOPATH/bin"
    "$CARGO_HOME/bin"
    "$BUN_INSTALL/bin"
    $path
)
export PATH
