#!/bin/sh

while getopts i:n:p:g:z:t: flag
do
    case "${flag}" in
        i) install=${OPTARG};;
        n) neovim=${OPTARG};;
        p) python=${OPTARG};;
        g) github=${OPTARG};;
        z) zsh=${OPTARG};;
        t) tmux=${OPTARG};;
    esac
done

cd ~

# atualiza os pacotes
sudo apt-get update -y
sudo apt-get upgrade -y

# instala os pacotes
sudo apt-get install make gcc g++ python3 python3-pip neovim curl ghdl -y

# instala o nordvpn
#sudo sh -c 'curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh'
#nordvpn login

# instalar GTKWave

# instala os pacotes python
pip3 install matplotlib numpy pandas scipy sklearn notebook keras tensorflow jedi

# neovim
CONFIG_DIR = "~/.config/"
if [ -d "$CONFIG_DIR"]; then
  cp -r ./config/.config/nvim ./.config/nvim
else
  cp -r config/.config ./.config
fi

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sudo apt-get install exuberant-ctags -y
sudo apt install npm -y
sudo npm install -g n
sudo n latest
cd plugged/coc.nvim/
sudo npm install -g yarn
sudo yarn install

git clone https://github.com/github/copilot.vim ~/.config/nvim/plugged/github/start/copilot.vim

# configura o zsh
# to do

#configura o tmux
# to do

# gera chave SSH pro github
ssh-keygen -t ed25519 -C "assissantosleandro@poli.ufrj.br"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
git config --global user.email "assissantosleandro@poli.ufrj.br"
git config --global user.name "Leandro Assis dos Santos"
echo "Segue sua chave SSH (copie e cole no github)"
cat ~/.ssh/id_ed25519.pub
