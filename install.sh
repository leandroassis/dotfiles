#!/bin/sh

# atualiza os pacotes
apt-get update -y
apt-get upgrade -y

# instala os pacotes
apt-get install make gcc g++ python3 python3-pip vim neovim-y

# instala o zsh
apt install zsh curl -y