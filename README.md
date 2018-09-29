# PimpMyMacOS

```
cd Downloads/
curl -O https://distfiles.macports.org/MacPorts/MacPorts-2.5.3.tar.bz2
tar zxvf MacPorts-2.5.3.tar.bz2
cd
mkdir MacPorts
cd Downloads/MacPorts-2.5.3
PATH=/usr/bin:/usr/sbin:/bin:/sbin ./configure --enable-readline --prefix=$HOME/MacPorts --with-no-root-privileges
make
make install

port install htop

chsh -s /bin/zsh

TODO:how to install oh my zsh

vi .zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

port install vim

mkdir -p ~/.vim/pack/dist/start/
cd ~/.vim/pack/dist/start/
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
git clone https://github.com/ConradIrwin/vim-bracketed-paste
  
cd ~/.vim
mkdir colors

TODO: copy solarized


  135  port install vim
  344  port install wget
  687  port install inetutils
  415  port install python37
  420  port install py37-pip
  594  port install nodejs8
  648  port install npm6
 1584  port install pwgen
   384  port install terraform
  410  port install py-novaclient
  ```
