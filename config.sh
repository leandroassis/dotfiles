#!/bin/sh

cd ~

# atualiza os pacotes
apt-get update -y
apt-get upgrade -y

# instala os pacotes
apt-get install make gcc g++ python3 python3-pip neovim curl -y

# instala o nordvpn
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
nordvpn login

# instala os pacotes python
pip3 install matplotlib numpy pandas scipy sklearn notebook keras tensorflow jedi

# neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
apt-get install exuberant-ctags -y
apt install nodejs npm -y
cd plugged/coc.nvim/
sudo npm install -g yarn
yarn install

git clone https://github.com/github/copilot.vim ~/.config/nvim/plugged/github/start/copilot.vim


# Microcontrollers tools

# gera chave SSH pro github
ssh-keygen -t ed25519 -C "assissantosleandro@poli.ufrj.br"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo "Segue sua chave SSH (copie e cole no github)"
cat ~/.ssh/id_ed25519.pub