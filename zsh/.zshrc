# Auto attach tmux
#[ -z "$TMUX"  ] && { tmux attach 2>/dev/null || exec tmux new-session -s "Home" -c "~" && exit;}

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.


# Source custom functions
for file (${(f)"$(find ~/.local/bin/ -maxdepth 1 -name '*.sh')"}) source $file

# Source Aliases
source ~/.zshaliases

# Bookmarks support
unalias cdg 2> /dev/null
cdg() {
   local dest_dir=~/$(fd --type d --base-directory ~ | fzf-tmux -p )
   if [[ $dest_dir != '' ]]; then
      cd "$dest_dir"
   fi
}
export -f cdg > /dev/null
source ~/.iterm


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char
# Vim Mode
bindkey -v
export KEYTIMEOUT=1


cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}
cursor_mode

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect '^[[Z' reverse-menu-complete

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/leonardo/.zshrc'
autoload -Uz ~/.prompt.sh; .prompt.sh
autoload -Uz compinit; compinit
_comp_options+=(globdots) # With hidden files
source ~/compinit.sh
eval "$(op completion zsh)"; compdef _op op
# End of lines added by compinstall
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
