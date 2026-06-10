
# >>> lean-ctx shell hook >>>
# Passthrough stubs: ensure _lc/_lc_compress exist in ALL zsh contexts
# (non-interactive subshells, eval, agent harnesses) so aliases that
# reference them degrade gracefully instead of "command not found".
# The full shell-hook.zsh overrides these when loaded via .zshrc.
_lc()          { command "$@"; }
_lc_compress() { command "$@"; }
if [[ -z "$LEAN_CTX_ACTIVE" && -n "$ZSH_EXECUTION_STRING" ]] && command -v lean-ctx &>/dev/null; then
  if [[ -n "$LEAN_CTX_AGENT" || -n "$CLAUDECODE" || -n "$CODEBUDDY" || -n "$CODEX_CLI_SESSION" || -n "$GEMINI_SESSION" ]]; then
    export LEAN_CTX_ACTIVE=1
    exec lean-ctx -c "$ZSH_EXECUTION_STRING"
  fi
fi
# <<< lean-ctx shell hook <<<

# lean-ctx shell hook — begin
if [ -f "/home/hiraeth/.config/lean-ctx/shell-hook.zsh" ]; then
. "/home/hiraeth/.config/lean-ctx/shell-hook.zsh"
fi
# lean-ctx shell hook — end

# >>> lean-ctx agent aliases >>>
alias claude='LEAN_CTX_AGENT=1 BASH_ENV="$HOME/.bashenv" claude'
alias codebuddy='LEAN_CTX_AGENT=1 BASH_ENV="$HOME/.bashenv" codebuddy'
alias codex='LEAN_CTX_AGENT=1 BASH_ENV="$HOME/.bashenv" codex'
alias gemini='LEAN_CTX_AGENT=1 BASH_ENV="$HOME/.bashenv" gemini'
# <<< lean-ctx agent aliases <<<

export TS_BASH_COMPACT=1     # compact git/pytest/cargo/gh/... outputs
export TS_BASH_REWRITE=1     # rewrite commands to denser variants
export TOKEN_SAVIOR_PROFILE=optimized
export LEAN_CTX_BIN="/usr/bin/lean-ctx"
