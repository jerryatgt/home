export PATH=$PATH:/usr/local/bin:/opt/sfw/bin:$HOME/bin:/usr/sbin
alias ='stty erase ^H'
alias ='stty erase ^?'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias du='du -kh'
alias df='df -kh'
alias zf=/Applications/MAMP/ZendFramework-1.10.4/bin/zf.sh

export PAGER=less

if test -x /usr/bin/dircolors; then
	eval $(dircolors -b)
	alias ls='ls --color=auto'
fi

# Define some colors first:
C_BLACK='\e[0;30m'
C_RED='\e[0;31m'
C_GREEN='\e[0;32m'
C_BROWN='\e[0;33m'
C_BLUE='\e[0;34m'
C_PURPLE='\e[0;35m'
C_CYAN='\e[0;36m'
C_LIGHT_GREY='\e[0;37m'
C_DARK_GREY='\e[1;30m'
C_LIGHT_RED='\e[1;31m'
C_LIGHT_GREEN='\e[1;32m'
C_YELLOW='\e[1;33m'
C_LIGHT_BLUE='\e[1;34m'
C_LIGHT_PURPLE='\e[1;35m'
C_LIGHT_CYAN='\e[1;36m'
C_WHITE='\e[1;37m'
C_NONE='\e[0m'              # No Color
# --> Nice. Has the same effect as using "ansi.sys" in DOS.

# Looks best on a black background.....

case $(hostname) in
io*)
	HILIT="$C_RED"
	;;
phantom*)
	HILIT="$C_LIGHT_CYAN"
	;;
*)
	HILIT="$C_LIGHT_BLUE"
	;;
esac



function which () {
	(
		export PATH=$PATH:/usr/sfw/bin:/opt/sfw/bin:/opt/SUNWspro/bin:/opt/SUNWspro/contrib/vim/bin
		type -all $1
	)
}

function _cmd () {
	xtitle "$*"
	command $*
}

function xtitle () {
	case "$TERM" in
		*term* | rxvt)
			echo -n -e "\033]0;$*\007" >&2 ;;
		*)  
		;;
	esac
}

function fastprompt()
{
    unset PROMPT_COMMAND
    case $TERM in
        *term* | rxvt )
           PS1="${HILIT}[\h]$C_NONE \W \$ \[\033]0;[\u@\h] \w\007\]" ;;
	linux )
           PS1="${HILIT}[\h]$C_NONE \W \$ " ;;
        *)
           PS1="[\u@\h] \W \$ " ;;
    esac
}

function powerprompt()
{
	_powerprompt()
	{
		LOAD=$(uptime 2>/dev/null|sed -e "s/.*: \([^,]*\).*/\1/" -e "s/ //g")
	}

	PROMPT_COMMAND=_powerprompt
	case $TERM in
	*term* | rxvt  )
		PS1="${HILIT}[\t \$LOAD \w]$C_NONE\n\u@\h\$ \
\[\033]0;[\u@\h] \w\007\]" ;;
	linux )
		PS1="${HILIT}[\t - \$LOAD \w]$C_NONE\n\u@\h\$ " ;;
	* )
		PS1="[\t - \$LOAD \w]\n\u@\h\$ " ;;
	esac
}

powerprompt

alias ssh="_cmd ssh"
alias screen="TERM=screen screen"
 source /Users/jerry/perl5/perlbrew/etc/bashrc
