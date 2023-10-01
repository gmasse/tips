if [ -d $HOME/MacPorts ]; then
  export PATH=$HOME/MacPorts/bin:$HOME/MacPorts/sbin:$PATH
  export MANPATH=$HOME/MacPorts/share/man:$MANPATH
  export LDFLAGS="-L$HOME/MacPorts/lib"
  export CFLAGS="-I$HOME/MacPorts/include"
fi
[ -d $HOME/homebrew/ ] && export PATH=$HOME/homebrew/bin/:$HOME/homebrew/sbin/:$HOME/bin:$PATH
[ -d $HOME/go/bin ] && export PATH=$HOME/go/bin:$PATH
python3 -m site &> /dev/null && export PATH=$(python3 -m site --user-base)/bin:$PATH
