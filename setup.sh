#!/bin/bash

sudo apt install gnome-tweaks;
sudo apt install neovim;
sudo apt install zsh curl git;
sudo apt install golang;
sudo apt install redis;
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list;
sudo apt update && sudo apt install yarn;


sudo apt install direnv;
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash;
ssh-keygen -t rsa -b 4096 -C "chris@copperlabs.com"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo apt install build-essential cmake python3-dev;

sudo add-apt-repository ppa:bit-team/stable;
sudo apt update;
sudo apt install backintime-qt4;

./install-postgres.sh;
./install-rabbit.sh;

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --rust-completer --ts-completer --go-completer

git config --global user.email "chris@copperlabs.com"
git config --global user.name "Chris Meyer"
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false
git config --global mergetool.keepBackup false

# no dock
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false

# backup utility
apt install borgbackup

# broot is better ls
cargo install broot

firefox https://pcaro.es/p/hermit/#downloads

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
# TODO ends at the above ^

