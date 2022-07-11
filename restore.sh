# Restore Neovim
echo "Restoring Neovim..."
cp -R ./nvim ~/.config

# Restore zsh
echo "Restoring ZSH..."
cp ./zsh/.p10k.zsh ~/.p10k.zsh
cp ./zsh/.zshrc ~/.zshrc

# Restore Alacritty
echo "Restoring Alacritty..."
cp -R ./alacritty ~/.config

# Restore Tmux 
echo "Restoring Tmux..."
if [ -d "~/.tmux" ]; then
  # Take action if $DIR exists. #
  echo "Cloning Oh My Tmux"
  cd
  git clone https://github.com/gpakosz/.tmux.git
  ln -s -f .tmux/.tmux.conf
fi
# Apply config
cp ./tmux/.tmux.conf.local ~/.tmux.conf.local 

