# Backup Neovim
echo "Backing up Neovim..."
cp -R ~/.config/nvim .

# Backup zsh
echo "Backing up ZSH..."
cp ~/.p10k.zsh ./zsh
cp ~/.zshrc ./zsh

# Backup Alacritty
echo "Backing up Alacritty..."
cp -R ~/.config/alacritty .

# Backup Tmux
echo "Backing up Tmux..."
cp ~/.tmux.conf.local ./tmux

