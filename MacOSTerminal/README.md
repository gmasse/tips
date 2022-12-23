# MacOS development environment tutorial

##### Table of Contents
1. [Fonts](#fonts)
2. [Macports (as non-root)](#macports-as-non-root)
3. [Zsh prompt (oh-my-zsh powered)](#zsh-prompt-oh-my-zsh-powered)
4. [SSH](#ssh)
5. [Git](#git)
6. [FAQ](#faq)


## Fonts
Editor Font: JetBrains Mono [Download](https://www.jetbrains.com/lp/mono/)

(Optional) Terminal Font: Input Mono Narrow Extra-light [Preview](https://input.fontbureau.com/preview/?size=12&language=python&theme=solarized-dark&family=InputMono&width=300&weight=200&line-height=1.2&a=0&g=0&i=0&l=0&zero=slash&asterisk=0&braces=straight&preset=default&customize=please)
[Download](https://input.fontbureau.com/download/index.html?customize&fontSelection=fourStyleFamily&regular=InputMonoNarrow-ExtraLight&italic=InputMonoNarrow-ExtraLightItalic&bold=InputMonoNarrow-Medium&boldItalic=InputMonoNarrow-MediumItalic&a=0&g=0&i=0&l=0&zero=slash&asterisk=0&braces=straight&preset=default&line-height=1.2)

## Macports (as non-root)
```
mkdir ~/MacPorts
cd ~/Downloads/
curl -O https://github.com/macports/macports-base/releases/download/v2.8.0/MacPorts-2.8.0.tar.bz2
tar zxvf MacPorts-2.8.0.tar.bz2
cd MacPorts-2.8.0
PATH=/usr/bin:/usr/sbin:/bin:/sbin ./configure --enable-readline --prefix=$HOME/MacPorts --with-no-root-privileges
make
make install

curl https://raw.githubusercontent.com/gmasse/tips/master/MacOSTerminal/.zprofile > ~/.zprofile
source ~/.zprofile

port -v selfupdate
```
Let's install some packages:
```
port install htop curl wget pwgen colordiff vim
```
### Awesome Packages
```
port install python39 py39-pip
port select --set python python39
port select --set python3 python39
port select --set pip pip39
port select --set pip3 pip39

port install nodejs12 npm6
port install terraform-0.12
port install autoconf automake bison flex gmake
port install cmake ninja # esp-idf
```
TODO: port install inetutils #not installing, as non-root user  

### Known issues
#### bsdtar (installing libarchive)
In non-root mode, there is an issue with bsdtar (failing with error 'Cannot restore xattr:com.apple.decmpfs').
The trick is to (temporarily) configure macports with no hfscompression ([source](https://trac.macports.org/ticket/56563#comment:29)).

Edit `macports.conf`:
```
vi $HOME/MacPorts/etc/macports/macports.conf
```
Uncomment the following line:
```
#hfscompression no
```
Relaunch install of `libarchive`:
```
port install libarchive
```
You can now re-enable hfscompression in `macports.conf` and finish installing your packages.

#### mtr
```
port install mtr
sudo chown root $(which mtr-packet)
sudo chmod 4755 $(which mtr-packet)
```

#### python cryptography package
```
env LDFLAGS="-L$HOME/MacPorts/lib" CFLAGS="-I/$HOME/MacPorts/include" pip install cryptography
```

## Zsh prompt (oh-my-zsh powered)
Change to zsh (if needed):
```
chsh -s /bin/zsh
```

### Aliases
Configure default aliases for login shell:
```
curl https://raw.githubusercontent.com/gmasse/tips/master/MacOSTerminal/.aliases > ~/.aliases
echo 'if [ -f $HOME/.aliases ]; then . $HOME/.aliases; fi' >> ~/.zlogin
source ~/.zlogin
```

### Oh-my-Zsh installation
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/gmasse/openstack_docker_env/master/all_in_one.sh)"
```

## SSH
Use MacOS keychain to store SSH passphrase ([reference](https://apple.stackexchange.com/a/264974)):
```
echo -n "Host *\n    UseKeychain yes\n" >> ~/.ssh/config
```

## Git
Local configuration:
```
git config core.editor "vi"
git config core.sshCommand 'ssh -i ~/.ssh/id_rsa_github'
git config user.email "g-dev@masse.me"
git config user.name "Germain Masse"
git config rebase.autosquash true
```
Or Global configuration:
```
git config --global core.editor "vi"
git config --global core.sshCommand 'ssh -i ~/.ssh/id_rsa_github'
git config --global user.email "g-dev@masse.me"
git config --global user.name "Germain Masse"
git config --global rebase.autosquash true
```
Add some Global OS dependant configuration:
```
curl https://raw.githubusercontent.com/gmasse/tips/master/MacOSTerminal/macos-gitignore > ~/.gitignore
git config --global core.excludesfile ~/.gitignore
```

## FAQ
### How to update MacPorts after a major system update?
Update Xcode and command line tools.
Download, compile an reinstall MacPorts [as seen before](#macports-as-non-root).
Reinstall all ports:
```
cd Downloads
port selfupdate
port -qv installed > myports.txt
port echo requested | cut -d ' ' -f 1 | uniq > requested.txt
port -f uninstall installed
port reclaim
curl --location --remote-name https://github.com/macports/macports-contrib/raw/master/restore_ports/restore_ports.tcl
chmod +x restore_ports.tcl
./restore_ports.tcl -p $HOME/MacPorts myports.txt
port unsetrequested installed
xargs port setrequested < requested.txt
rm myports.txt requested.txt restore_ports.tcl
```
If you encounter this warning "The Xcode Command Line Tools package appears to be installed, but its receipt appears to be missing". Please follow these steps to reinstall command line tools : https://trac.macports.org/wiki/ProblemHotlist#reinstall-clt
