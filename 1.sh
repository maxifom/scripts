sudo apt install -y git-core zsh fonts-powerline;
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh) -y";
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting; 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions;
sed -i 's/(git)/(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
source ~/.zshrc;
chsh -s $(which zsh);
curl -fsSL https://get.docker.com -o get-docker.sh;
sh get-docker.sh;
rm get-docker.sh;

