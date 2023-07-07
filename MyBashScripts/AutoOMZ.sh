#!/bin/bash
set -e  #Stop the script if something goes wrong

sudo apt install -y zsh     #ZSH installation
echo "==== Installing of ZSH was successful! =====" 

sudo chsh -s $(which zsh)    #Set the ZSH as default shell
echo "==== Now ZSH has become your default shell! ====="

sudo yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y  #OhMyZsh installation
echo "==== Installing of OhMyZsh was successful! ====="

sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
sudo git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
sudo git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
echo "==== Downloading of plugins was successful! ====="

old_plugins_string="plugins=(git)"
new_plugins_string="plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)"

sed -i 's/$old_plugins_string/$new_plugins_string/' ~/.zshrc
echo "==== ZSH installation complete! Please restart your shell ===="

exit 0



