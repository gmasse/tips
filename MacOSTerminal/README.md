# Vim/Python/NodeJS

```
mkdir ~/MacPorts
cd Downloads/
curl -O https://distfiles.macports.org/MacPorts/MacPorts-2.6.2.tar.bz2
tar zxvf MacPorts-2.6.2.tar.bz2
cd MacPorts-2.6.2
PATH=/usr/bin:/usr/sbin:/bin:/sbin ./configure --enable-readline --prefix=$HOME/MacPorts --with-no-root-privileges
make
make install

echo 'export PATH=$HOME/MacPorts/bin:$HOME/MacPorts/sbin:$PATH
export MANPATH=$HOME/MacPorts/share/man:$MANPATH
if [ -f $HOME/.aliases ]; then . $HOME/.aliases; fi' >> ~/.bash_profile
source ~/.bash_profile

port -v selfupdate
port install htop wget pwgen colordiff

# In non-root mode, there is an issue with bsdtar (failing with error 'Cannot restore xattr:com.apple.decmpfs')
# The trick is to configure macports with no hfscompression then install libarchive (then re-enable hfscompression)
# https://trac.macports.org/ticket/56563#comment:29
# To reinstall previously installed packages with hfscompression: port upgrade --force `port -q installed | grep -v libarchive | cut -d' ' -f 3 | xargs`


port install mtr
sudo chown root /sbin/mtr-packet
sudo chmod 4755 /usr/local/sbin/mtr-packet


chsh -s /bin/zsh

TODO:how to install oh my zsh

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

vi .zshrc


port install vim
mkdir -p ~/.vim/colors
curl -o ~/.vim/colors/solarized.vim https://raw.githubusercontent.com/altercation/solarized/master/vim-colors-solarized/colors/solarized.vim

mkdir -p ~/.vim/pack/dist/start/
cd ~/.vim/pack/dist/start/
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
git clone https://github.com/ConradIrwin/vim-bracketed-paste

curl -o ~/.vim/vimrc https://raw.githubusercontent.com/gmasse/tips/master/MacOSTerminal/.vimrc


  415  port install python37
  420  port install py37-pip
  594  port install nodejs8
  648  port install npm6
   384  port install terraform
  410  port install py-novaclient
  
  
TODO: port install inetutils #not installing, as non-root user  




*** GIT ***

local configurtion:

git config core.editor "vi"
git config core.sshCommand 'ssh -i ~/.ssh/id_rsa_github'
git config user.email "g-dev@masse.me"
git config user.name "Germain Masse"

OR global configuration:

git config --global core.editor "vi"
git config --global core.sshCommand 'ssh -i ~/.ssh/id_rsa_github'
git config --global user.email "g-dev@masse.me"
git config --global user.name "Germain Masse"

```
