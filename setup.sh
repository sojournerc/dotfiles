#!/bin/bash

sudo apt install gnome-tweaks;
sudo apt install neovim;
sudo apt install zsh curl git;
sudo apt install golang;
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list;
sudo apt update && sudo apt install yarn;
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
sudo apt install direnv;
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash;
ssh-keygen -t rsa -b 4096 -C "chris@copperlabs.com"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo apt install build-essential cmake python3-dev;

sudo add-apt-repository ppa:bit-team/stable;
sudo apt update;
sudo apt install backintime-qt4;

# POSTGRESQL
sudo apt install postgresql-11;
sudo systemctl start postgresql@11-main;
sudo su - postgres;
psql -c "alter user postgres with password 'postgres'";
createdb cl-local -O postgres;
logout;
sudo add-apt-repository ppa:timescale/timescaledb-ppa
sudo apt-get update
sudo apt install timescaledb-postgresql-11;
timecaledb-tune --quiet --yes;
sudo apt install postgis;
sudo service postgresql restart;

./install-rabbit.sh;

cd ~/.vim/bundle/YouCompleteMe
python3 install.py --rust-completer --ts-completer --go-completer

git config --global user.email "chris@copperlabs.com"
git config --global user.name "Chris Meyer"

# no dock
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false

firefox https://pcaro.es/p/hermit/#downloads
firefox https://dystroy.org/broot/documentation/installation://dystroy.org/broot/documentation/installation/
