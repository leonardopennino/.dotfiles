#!/usr/bin/env zsh
if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="nvim,zsh,tmux,yabai,skhd"
fi

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/dotfiles
fi

if [[ -n $HOME/.oh-my-zsh/custom ]]; then
  rm -rf $HOME/.oh-my-zsh/custom
fi

pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g"); do
  stow -D $folder
  stow $folder
done
popd

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

$HOME/.tmux/plugins/tpm/bin/install_plugins
$HOME/.tmux/plugins/tpm/bin/update_plugins all
