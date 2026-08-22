
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

export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix'  # strip-cwd-prefix removes the leading ./ from results


source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
