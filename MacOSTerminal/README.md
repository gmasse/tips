# Vim/Python/NodeJS

```
mkdir ~/MacPorts
cd Downloads/
curl -O https://distfiles.macports.org/MacPorts/MacPorts-2.6.0.tar.bz2
tar zxvf MacPorts-2.6.0.tar.bz2
cd MacPorts-2.6.0
PATH=/usr/bin:/usr/sbin:/bin:/sbin ./configure --enable-readline --prefix=$HOME/MacPorts --with-no-root-privileges
make
make install

echo 'export PATH=$HOME/MacPorts/bin:$HOME/MacPorts/sbin:$PATH' >> ~/.bash_profile
echo 'export MANPATH=$HOME/MacPorts/share/man:$MANPATH' >> ~/.bash_profile
source ~/.bash_profile

port -v selfupdate
port install htop wget pwgen

port install mtr
sudo chown root /sbin/mtr-packet
sudo chmod 4755 /usr/local/sbin/mtr-packet


chsh -s /bin/zsh

TODO:how to install oh my zsh

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

vi .zshrc

port install vim

mkdir -p ~/.vim/pack/dist/start/
cd ~/.vim/pack/dist/start/
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
git clone https://github.com/ConradIrwin/vim-bracketed-paste
  
cd ~/.vim
mkdir colors

TODO: copy solarized



  415  port install python37
  420  port install py37-pip
  594  port install nodejs8
  648  port install npm6
   384  port install terraform
  410  port install py-novaclient
  
  
TODO: port install inetutils #not installing, as non-root user  
  
```
