# alias
alias brc="nvim ~/.bashrc"
alias balias="nvim ~/.bash_aliases"
alias benv="nvim ~/.bash_env"

alias n="nvim"
alias nn="nvim ."
alias vv="vim ."
alias nf="fzf --preview 'cat {}' --bind 'enter:become(nvim {})'"
alias vf="fzf --preview 'cat {}' --bind 'enter:become(vim {})'"

# alias lazyvim="NVIM_APPNAME=lazyvim nvim"
# alias nativim="NVIM_APPNAME=nativim nvim"
# alias nativim="NVIM_APPNAME=nativim nvim"

# git
alias gx="git clean -xdf"
alias gl="git log --graph --oneline --decorate --all"
alias gpatch="git format-patch -1"
alias gc="git clone "
alias gc1="git clone --depth 1"

alias githost="sudo sh -c 'sed -i \"/# GitHub520 Host Start/Q\" /etc/hosts && curl https://raw.hellogithub.com/hosts >> /etc/hosts'"


# status

# cli
alias l="lsd -l"
alias ll="lsd -lA"
alias tree="lsd --tree"
alias gg="lazygit"
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias weather="curl 'v2d.wttr.in/Beijing'"
alias s="fastfetch"

# rclone
# alias rapush="rclone sync ~/Documents/ koofr:/kDocuments/  --track-renames --filter-from ~/.config/rclone/filter-list.txt --no-update-dir-modtime --no-update-modtime --transfers 20 -i -L && notify-send 'rclone' 'force push ~/Documents to kDocuments'"
# alias rapull="rclone sync koofr:/kDocuments/ ~/Documents/ --backup-dir ~/conflicts --suffix '_local' --suffix-keep-extension --track-renames  --no-update-dir-modtime --no-update-modtime --filter-from ~/.config/rclone/filter-list.txt --transfers 20 -i -L && notify-send 'rclone' 'download from kDocuments to ~/Documents'"
alias rppush="rclone sync ~/Documents/projects/ koofr:/kDocuments/projects/  --track-renames --filter-from ~/.config/rclone/filter-list.txt --no-update-dir-modtime --no-update-modtime --transfers 20 -i -L && notify-send 'rclone' 'force push ~/Documents to kDocuments'"
alias rppull="rclone sync koofr:/kDocuments/projects/ ~/Documents/projects/ --backup-dir ~/conflicts --suffix '_local' --suffix-keep-extension --track-renames  --no-update-dir-modtime --no-update-modtime --filter-from ~/.config/rclone/filter-list.txt --transfers 20 -i -L && notify-send 'rclone' 'download from kDocuments to ~/Documents'"
# alias rzpush="rclone sync ~/Documents/zotero_files/ koofr:/kDocuments/zotero_files/  --track-renames --no-update-dir-modtime --no-update-modtime --transfers 20 -i -L && notify-send 'rclone' 'force push ~/Documents/zotero_files to koofr'"
# alias rzpull="rclone sync koofr:/kDocuments/zotero_files/ ~/Documents/zotero_files/ --backup-dir ~/conflicts --suffix '_local' --suffix-keep-extension --track-renames  --no-update-dir-modtime --no-update-modtime --transfers 20 -i -L && notify-send 'rclone' 'download from koofr to ~/Documents/zotero_files/'"
alias ropush="rclone sync ~/obsidian/ koofr:/obsidian/  --track-renames --filter-from ~/.config/rclone/filter-list.txt --no-update-dir-modtime --no-update-modtime --transfers 20 -i -L && notify-send 'rclone' 'force push ~/Documents to kDocuments'"
alias ropull="rclone sync koofr:/obsidian/ ~/obsidian/ --backup-dir ~/conflicts --suffix '_local' --suffix-keep-extension --track-renames  --no-update-dir-modtime --no-update-modtime --filter-from ~/.config/rclone/filter-list.txt --transfers 20 -i -L && notify-send 'rclone' 'download from kDocuments to ~/Documents'"

alias bak="sudo timeshift --check && sudo update-grub"
