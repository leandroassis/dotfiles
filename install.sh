#!/bin/sh

# atualiza os pacotes
apt-get update -y
apt-get upgrade -y

# instala os pacotes
apt-get install git gcc g++ python3 python3-pip -y

# instala o zsh
apt install zsh curl -y