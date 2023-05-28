#!/bin/sh
install=1
neovim=1
python=1
github=1
zsh=1
tmux=1

cd ~

CONFIG_DIR="~/.config/"
if [ -d "$CONFIG_DIR" ]
then
  cp -rf config/.config/nvim .config/nvim && cp -rf config/.config/tmux .config/tmux
else
  cp -rf config/.config ./.config
fi

# instala as tools básicas
if [ $install==1 ]
then
  # atualiza os pacotes
    sudo apt-get update -y
    sudo apt-get upgrade -y

    # instala o tools
    sudo apt-get install conky moc ffmpeg conky-all fortune-mod acpi ncal gnome-shell-extension-manager sassc clang gnome-tweaks make gcc g++ python3 python3-pip neovim fd-find fzf wget curl ghdl zsh snap gtkwave tmux bspwm sxhkd -y

    # instala o nordvpn
    #sudo sh -c 'curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh'
    #nordvpn login

    # instala o spotify
    snap install spotify
    snap install discord

    # instala o opera
    sudo apt install software-properties-common apt-transport-https wget ca-certificates gnupg2
    wget -O- https://deb.opera.com/archive.key | sudo gpg --dearmor | sudo tee /usr/share/keyrings/opera.gpg
    echo deb [arch=amd64 signed-by=/usr/share/keyrings/opera.gpg] https://deb.opera.com/opera-stable/ stable non-free | sudo tee /etc/apt/sources.list.d/opera.list
    sudo apt update
    sudo apt install opera-stable
fi

# instala os pacotes python
if [ $python==1 ]
then
  pip3 install matplotlib numpy pandas scipy sklearn notebook keras tensorflow jedi
fi

# configura o neovim
if [ $neovim==1 ]
then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    sudo apt-get install exuberant-ctags -y
    sudo apt install npm -y
    sudo npm install -g n
    sudo n latest
    cd plugged/coc.nvim/
    sudo npm install -g yarn
    sudo yarn install

    git clone https://github.com/github/copilot.vim ~/.config/nvim/plugged/github/start/copilot.vim
fi

# configura o zsh
if [ $zsh=0 ]
then
  sh -c "$(curl -fsSl https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

#configura o tmux
if [ $tmux==1 ]
then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# gera chave SSH pro github
if [ $github==1 ]
then
  ssh-keygen -t ed25519 -C "assissantosleandro@poli.ufrj.br"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
  git config --global user.email "assissantosleandro@poli.ufrj.br"
  git config --global user.name "Leandro Assis dos Santos"
  echo "Segue sua chave SSH (copie e cole no github)"
  cat ~/.ssh/id_ed25519.pub
fi

git clone https://github.com/vinceliuice/Colloid-gtk-theme.git ~/colloid
./colloid/install.sh --tweaks nord

git clone https://github.com/vinceliuice/Colloid-icon-theme.git ~/colloid-icons
./colloid-icons/install.sh -s nord

curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh
git clone --depth=1 https://github.com/spicetify/spicetify-themes.git 
cp -r spicetify-themes/* ~/.config/spicetify/Themes
spicetify config current_theme Sleek
spicetify config color_scheme nord

if [ $zsh=1 ]
then
  sudo rm -rf ~/.zshrc
  cp config/.zshrc ~/.zshrc
  zsh
  echo "Não esqueça de setar o zsh no comando de inicialização do terminal."
fi

git clone https://github.com/Kosteron/Conky.git
mkdir ~/.conky
mv Conky/* ~/.conky
chmod +x ~/.conky/conky-launch.sh
~/.conky/conky-launch.sh
sudo mv ~/.conky/fonts/* /usr/share/fonts