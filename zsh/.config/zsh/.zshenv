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

# export ZOTERO_API_KEY="vxwGh0XaMLa637qhhGYZ48LS"
# export ZOTERO_USER_ID="9666949"
