change_dir() {
  cd $(fd --type d --base-directory ~ | fzf-tmux -p)
}
zle -N change_dir
bindkey "^g" change_dir
