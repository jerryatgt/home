#export PATH=$PATH:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/sfw/bin:/usr/sfw/sbin:/usr/openwin/bin

case $(uname -s) in 
Linux)
	case $TERM in
	xterm) export TERM=xterm-color;;
	dtterm) export TERM=xterm-color;;
	esac
#	export TERM=xterm-color
	;;
SunOS)
	case $TERM in
	xterm-color) export TERM=dtterm;;
	esac
#	export TERM=dtterm
	;;
esac

if test -f "$HOME/.colorterm"; then
	export TERM=$(cat $HOME/.colorterm)
fi

export VISUAL=vi

umask 022

if test -r $HOME/.bashrc; then
	export BASH_ENV=$HOME/.bashrc
	. $HOME/.bashrc
fi

powerprompt

test -r /sw/bin/init.sh && . /sw/bin/init.sh
