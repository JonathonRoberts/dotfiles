#skip remaining setup if shell non-interactive
[ -o interactive ] || return 0

# Base Korn Shell environment
[ -r /etc/ksh.kshrc ] && . /etc/ksh.kshrc

BLOCKSIZE=512
EDITOR=vim
PAGER="less"
LESS="-mWN"
PKG_PATH=http://mirror.bytemark.co.uk/pub/OpenBSD/`uname -r`/packages/`machine -a`/
PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/X11R6/bin:/usr/local/sbin:/usr/local/bin:/usr/games:~/.bin
#PS1="\u@\h:\w[\t]\$ "
PS1="\u@\h:\w>\$ "
export PS1 PKG_PATH PATH PAGER LESS EDITOR BLOCKSIZE

set -o vi
set +o markdirs      # Add / to all directory names generated from wildcard expansion.
set +o allexport
set -o noclobber  # Don't allow > redirection to existing files.
set -o trackall      # Substitute full pathnames for commands in alias expansions.

umask 022

#Record history
DATESTAMP=$(date +%Y%m%d)
HISTDIR=$HOME/.history
if [ ! -d $HISTDIR ]; then mkdir $HISTDIR; fi
HISTFILE="$HISTDIR/${DATESTAMP}_${REALUSER}"
HISTSIZE=10000
export HISTSIZE HISTFILE


#pushh and popd
function pushd {
  cd $1
  DIR=`pwd`
  export __DIRSTK="$DIR":$__DIRSTK
}
function popd {
  DIR=`echo $__DIRSTK|cut -f 2 -d:`
  if test "$DIR" != ""
    then cd $DIR;
    else cd -
  fi
  export __DIRSTK=`echo $__DIRSTK|cut -f 2- -d:`
}

## Completion stuff
#bind "^I=complete"      # Complete to next unmatch with tab key
bind "^I=complete-list" # List completions in the dir by tapping on the tab
