# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# shortcut
# =========================================================
# 101 linux
# export CDPATH='~/aboss-api2/:~/aboss-api2/public/aboss-ui/'
export CDPATH="$CDPATH:~/aboss-api2/:~/aboss-api2/public/aboss-ui/audt"
export CDPATH="$CDPATH:~/aboss-api2/:~/aboss-api2/public/aboss-ui/repa"
export CDPATH="$CDPATH:~/aboss-api2/:~/aboss-api2/public/aboss-ui/cacc"
export CDPATH="$CDPATH:~/aboss-api2/:~/aboss-api2/public/aboss-ui/coll"
export CDPATH="$CDPATH:~/aboss-api2/:~/aboss-api2/public/aboss-ui/crdb"
export CDPATH="$CDPATH:~/aboss-api2/:~/aboss-api2/public/aboss-ui/inst"
export CDPATH="$CDPATH:~/aboss-api2/:~/aboss-api2/public/aboss-ui/fund"
export CDPATH="$CDPATH:~/aboss-api2/:~/aboss-api2/public/aboss-ui/sblt"
export CDPATH="$CDPATH:~/aboss-api2/:~/aboss-api2/public/aboss-ui/trad"
function mkdircd() { mkdir -p "$@" && eval cd "\"\$$#\""; }
# --------------------------------------------------------

# nav
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias lsd='ls -l | grep "^d"'

# projects
alias a2='cd ~/work/aboss-api2/'
alias ui='cd ~/work/aboss-api2/public/aboss-ui/'
alias inqd='cd ~/aboss-api2/app/models/inquiries'

alias cdpmoc='cd ~/ssf/pmoc_ios/'

# control version
alias sm='svn st | grep ^M'
alias sc='svn st | grep "^[^\?]"'
alias svnci='svn ci -m '
alias sup='svn up' 

# since log
# myslog 2013-08-01
myslog(){
    echo $1
    # rev_list=$(svn log -q -r {$1}:{`date --date='tomorrow' +%Y-%m-%d`} | grep sarunyoo | cut -d"|" -f1 | sed 's/r/\-r/g')
    rev_list=$(svn log -q -r {$1}:{$2} | grep sarunyoo | cut -d"|" -f1 | sed 's/r/\-r/g')
    if [[ -z "$rev_list" ]]
    then
        echo "Nothing committed today"
    else
        svn log -v $rev_list
    fi
}
# my svn log today
mylog(){
    rev_list=$(svn log -q -r {`date +%Y-%m-%d`}:{`date --date='tomorrow' +%Y-%m-%d`} | grep sarunyoo | cut -d"|" -f1 | sed 's/r/\-r/g')
    if [[ -z "$rev_list" ]]
    then
        echo "Nothing committed today"
    else
        svn log -v $rev_list
    fi
}

function d(){
    echo "dash://$1"
}

# programs
alias r='rails '
alias v='vim '
alias e='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias contain=". ~/bashscripts/contain.sh"
alias dsync='.dropbox-dist/dropbox start &' 
alias unsetproxy='unset https_proxy && unset http_proxy'
alias set_mfec_proxy='export http_proxy=http://lpn.mfec.co.th:8080 && export https_proxy=http://lpn.mfec.co.th:8080 && export ftp_proxy=http://lpn.mfec.co.th:8080'

# functions
alias ext='ruby ~/play/ejext/generator/jxc.rb'
alias xext='ruby ~/play/ejext4/generator/jxc.rb'
alias inq='ruby ~/work/aboss-api2/script/screen/gen_inquiry.rb'
alias egf='ruby ~/aboss-api2/script/ext/rails/grid_for.rb'
alias eff='ruby ~/aboss-api2/script/ext/rails/form_for.rb'
alias gin='ruby ~/aboss-api2/script/screen/gen_index.rb'
alias rcof='ruby ~/coffeescript/cc.rb'
alias clipit='xclip -sel clip' # use after pipe 

# TMUX -------------------------------------------------------------------------
alias tm="tmux new-session -n "
alias tmat="tmux attach-session -t "
alias tmls="tmux list-sessions"
alias tmkill="tmux kill-session -t "

# start develop aboss project
# alias abup='cd ~/aboss-api2/ && sup && subl & cd ~/aboss-api2/ && (google-chrome mail.google.com portal.angstrom.co.th localhost:3000 > /dev/null && r s thin )'

abup(){
  e & 
  cd ~/aboss-api2/;
  echo "----- Update Project -----";
  svn up;
  echo "----- Start Chrome -----";
  google-chrome mail.google.com portal.angstrom.co.th localhost:3000 &> /dev/null &
  echo "----- Running Thin Server -----";
  rails server thin;
}

mem(){
    TEXT=`top -n 1 -b | grep 'Mem'`
    TOTAL=`echo $TEXT | cut -d' ' -f2 | cut -d'k' -f1`
    USAGED=`echo $TEXT | cut -d' ' -f4 | cut -d'k' -f1`
    FREE=`echo $TEXT | cut -d' ' -f6 | cut -d'k' -f1`
    #echo $TEXT
    #echo $TOTAL
    echo Free `expr $(echo $FREE) \* 100 / $(echo $TOTAL)`%
}

# export
# =========================================================
export HISTCONTROL=erasedups
export EDITOR='vim'
export RUBYLIB=~/aboss-lib/
export ABOSS_DATA=~/aboss-data

# export PS1='\[\033[s\]\[\033[1;$((COLUMNS-20))f\]\e[1;33m (\j) `date +%H:%M`\e[0m\[\033[u\]\e[1;36m\W\e[0m \e[1;35m$\e[0m '
# export PS1='\e[32;1m`date +%H:%M`\e[00m \e[33;1m\j\e[00m \e[36;1m\w\e[00m\n\e[35;1m$\e[00m '
export PS1='`date +%H:%M` (\j) ---------- \w\n\$ '
# export PS1='\e[01;40m$(jobs | wc -l)j \W\e[00m '
# export PS1='\u@\h:\e[01;43m\W\e[00m> '
# export PS1="\e[36;1m\w\e[0m\n\$ "

# export PS1='------------| \w |------------\n\$ '
# export PS1="\e[31;1m\$(s=\$(printf "%*s" \$COLUMNS); echo \${s// /―})\n)\e[0m ";

alias md='~/Downloads/Markdown_1.0.1/Markdown.pl'
# open current directory
alias opendir='nautilus'
alias pdf='evince'

alias emptytrash="sudo rm -rfv ~/.local/share/Trash/files"

# =========================================================
# functions
vid2gif(){
    mkdir output;
    mplayer -ao null $1 -vo jpeg:outdir=output;
    convert output/* output.gif;
    if [ -z $2 ]; then
        convert output.gif -fuzz 10% -layers Optimize optimised.gif;
    else
        convert output.gif -fuzz 10% -layers Optimize $2.gif;
    fi
    rm output.gif;
    rm -rf output;
}

# --------------

CACHED_BASE_RESULT=~/.bash_cached_result

function lf(){
    if [ -z $1 ]; then
        less -N $CACHED_BASE_RESULT
    else
        # inline="find . | ruby -ne 'puts \$_ if \$_.match Regexp.new(\"$1\", \"i\")' > $CACHED_BASE_RESULT && less -N -p$1 $CACHED_BASE_RESULT"
        inline="find . -iname '*$1*' -type f -print > $CACHED_BASE_RESULT && less -N -p$1 -i $CACHED_BASE_RESULT"
        eval $inline
    fi
    # echo $1;
    # echo $inline
}

function vv(){
    if [ -z "$1" ]; then
       v `head -1 "$CACHED_BASE_RESULT"`
    else
       if [ -z "$2" ]; then
           v -O `head -$1 $CACHED_BASE_RESULT | tail -1`
       else
           if [ -z "$3" ]; then
               v -O `head -$1 $CACHED_BASE_RESULT | tail -1` `head -$2 $CACHED_BASE_RESULT | tail -1`
           fi
       fi
    fi
}

# --------------

alias ll='ls -alF'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# export PATH=~/pebble-dev/PebbleSDK-2.0-BETA2/bin:$PATH
# pg
# export PATH=/Applications/Postgres93.app/Contents/MacOS/bin/:$PATH

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# [ -s "/Users/jing/.nvm/nvm.sh" ] && . "/Users/jing/.nvm/nvm.sh" # This loads nvm
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Color LS
colorflag="-G"
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}" # all files, in long format
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Colored up cat!
# You must install Pygments first - "sudo easy_install Pygments"
alias c='pygmentize -O style=monokai -f console256 -g'

# Git
# You must install Git first
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m' # requires you to type a commit message
alias gp='git push'
alias grm='git rm $(git ls-files --deleted)'

### Prompt Colors
# Modified version of @gf3’s Sexy Bash Prompt
# (https://github.com/gf3/dotfiles)
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		MAGENTA=$(tput setaf 9)
		ORANGE=$(tput setaf 172)
		GREEN=$(tput setaf 190)
		PURPLE=$(tput setaf 141)
	else
		MAGENTA=$(tput setaf 5)
		ORANGE=$(tput setaf 4)
		GREEN=$(tput setaf 2)
		PURPLE=$(tput setaf 1)
	fi
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
else
	MAGENTA="\033[1;36m"
	ORANGE="\033[1;33m"
	GREEN="\033[1;32m"
	PURPLE="\033[1;35m"
	BOLD=""
	RESET="\033[m"
fi

export MAGENTA
export ORANGE
export GREEN
export PURPLE
export BOLD
export RESET

# Git branch details
function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}
function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# Change this symbol to something sweet.
# (http://en.wikipedia.org/wiki/Unicode_symbols)
symbol="⚡ "

export PS1="\[${MAGENTA}\]\u \[$RESET\]in \[$PURPLE\]\w\[$RESET\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$RESET\]\n$symbol\[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"


### Misc

# Only show the current directory's name in the tab
# export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
