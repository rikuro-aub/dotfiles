# プロンプト設定
source /usr/local/Cellar/git/2.22.0_1/etc/bash_completion.d/git-prompt.sh
source /usr/local/Cellar/git/2.22.0_1/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
#PS1='\[\e[34m\]\t \[\e[34m\]\W \[\e[1m\]$ '
PS1='\[\e[34m\]\t \[\e[34m\]\W\[\e[36m\]$(__git_ps1)\[\e[0m\]\n$ '

# エイリアス設定
alias ls='ls -G'
alias ll='ls -laG'

