#!/bin/zsh
#
# Attach or create tmux session named the same as current directory.


not_in_tmux() {
  [ -z "$TMUX" ]
}

session_exists() {
  tmux has-session -t "=$session_name" 2> /dev/null
}

create_detached_session() {
  (TMUX='' tmux new-session -Ad -s "$session_name" -c "$DIR")
}

tan() {
  DIR=~/$(fd --type d --base-directory "$HOME" | fzf-tmux -p)
  DIR=$(echo $DIR | sed 's/\/$//')
  path_name="$(basename "$DIR" | tr . -)"
  session_name=${path_name}
  if not_in_tmux; then
    tmux new-session -As "$session_name" -c "$DIR"
  else
    if ! session_exists; then
      create_detached_session
    fi
    tmux switch-client -t "$session_name"
  fi
}
tat(){
  tmux list-sessions | sed -E 's/:.*$//' | grep -v \"^$(tmux display-message -p '#S')\$\" | fzf-tmux -p --reverse | xargs tmux switch-client -t
  #CTRL-S
}
tkill(){
  for s in $(tmux list-sessions | awk '{print $1}' | rg ':' -r '' | fzf-tmux -m); do tmux kill-session -t $s; done;
}
