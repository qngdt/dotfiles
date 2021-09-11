# Restore Neovim
cp -R ./nvim/* ~/.config/nvim

# Restore LunvarVim
cp ./lvim/config.lua ~/.config/lvim

# Restore zsh
cp ./zsh/.p10k.zsh ~/.p10k.zsh
cp ./zsh/.zshrc ~/.zshrc

# Restore Alacritty
cp -R ./alacritty/* ~/.config/alacritty

# Restore Tmux 
if [ -d "~/.tmux" ]; then
  # Take action if $DIR exists. #
  echo "Cloning Oh My Tmux"
  cd
  git clone https://github.com/gpakosz/.tmux.git
  ln -s -f .tmux/.tmux.conf
fi
# Apply config
cp ./tmux/.tmux.conf.local ~/.tmux.conf.local 
