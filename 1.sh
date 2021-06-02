#!/bin/bash

set -ex;
apt update -y && apt upgrade -y;
apt install -y git-core zsh fonts-powerline wget curl htop;
wget https://raw.githubusercontent.com/maxifom/install_zsh/master/zsh.sh;
chmod +x ./zsh.sh;
sh install.sh --unattended;
chsh -s zsh;
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting; 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions;
sed -i 's/(git)/(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
source ~/.zshrc;
wget -O docker.sh https://get.docker.com;
chmod +x ./docker.sh;
./docker.sh;
rm docker.sh install.sh;
echo "DONE";








