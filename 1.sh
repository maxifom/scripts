#!/bin/bash

set -ex;
apt update -y && apt upgrade -y;
apt install -y git-core zsh fonts-powerline wget curl htop;
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh;
chmod +x ./install.sh;
./install.sh --unattended;
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting; 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions;
sed -i 's/(git)/(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
source ~/.zshrc;
wget -O docker.sh https://get.docker.com;
chmod +x ./docker.sh;
./docker.sh;
rm docker.sh install.sh;
echo "DONE";








