#!/bin/sh

#instala os binários
chmod +x install.sh
sudo ./install.sh

cd ~

# instala o oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i 's/ZSH_THEME="robbyryssell"/ZSH_THEME="candy"/g' ~/.zshrc

#instala o omni
git clone https://github.com/getomni/gnome-terminal.git
apt install dconf-cli -y
cd gnome-terminal && ./install.sh

# instala o zinit
sh -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
echo "zinit light zdharma/fast-syntax-highlighting" >> ~/.zshrc
echo "zinit light zsh-users/zsh-autosuggestions" >> ~/.zshrc
echo "zinit light zsh-users/zsh-completions" >> ~/.zshrc

# instala o nordvpn
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
nordvpn login

# instala os pacotes python
pip3 install matplotlib numpy pandas scipy sklearn notebook