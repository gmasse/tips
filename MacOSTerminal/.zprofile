export PATH=$HOME/MacPorts/bin:$HOME/MacPorts/sbin:$PATH
python3 -m site &> /dev/null && export PATH="`python3 -m site --user-base`/bin:$PATH"
export MANPATH=$HOME/MacPorts/share/man:$MANPATH
export LDFLAGS="-L$HOME/MacPorts/lib"
export CFLAGS="-I$HOME/MacPorts/include"
