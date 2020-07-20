export TERM=xterm-256color

# ANSI color codes -----------------------------------------------------------
# https://gist.github.com/chrisopedia/8754917
GREEN='\e[0;32m\]'
B_MAGENTA='\e[1;35m\]'
YELLOW='\e[0;33m\]'
RED='\e[0;31m\]'
CYAN='\e[0;36m\]'
COLOR_END='\[\033[0m\]'

# PROMPT 
TIMESTAMP='\D{%F %a %T}'

GITHUD=''
if [ $(which githud 2> /dev/null) ]; then
  GITHUD="\$(githud)"
fi

PS1="${CYAN}\w ${GITHUD} ${COLOR_END}\n\$ "
export PS1
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# GIT
source ~/git-completion.bash
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.local/bin/fav-dir.sh ] && source ~/.local/bin/fav-dir.sh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#ALIAS
alias yun='sh $HOME/ShellScripts/yun.sh'
alias ys="/Users/yunseok/ShellScripts/yunseok.sh"
