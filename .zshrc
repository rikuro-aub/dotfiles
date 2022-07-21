# 色の設定
autoload -Uz colors
colors

# プロンプト用のGit表示設定
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true		#formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{green}!"		#commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+"	#add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f"	#通常
zstyle ':vcs_info:*' actionformats '[%b|%a]'		#rebase 途中,merge コンフリクト等 formats 外の表示
precmd () { vcs_info }

# プロンプト設定
PROMPT='%{${fg[blue]}%}%* %~ %{${reset_color}%}${vcs_info_msg_0_}
$ '

# 大文字小文字を同一視して補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# <Tab>でパス名の補完候補を表示したあと、
# 続けて<Tab>を押すと候補からパス名を選択することができるようになる
zstyle ':completion:*:default' menu select=1

# エイリアス設定
alias ls='ls -G'
alias ll='ls -laG'
alias dc='docker compose'
alias dce='docker compose exec'
alias dcr='docker compose run'

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm alias default node

#Android Studioの設定
export ANDROID_SDK=/Users/3no3/Library/Android/sdk
export PATH=/Users/3no3/Library/Android/sdk/platform-tools:$PATH

# gitコマンドの補完設定
mkdir -p ~/.zsh/completion
cd ~/.zsh/completion
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
mv git-completion.zsh _git
fpath=(~/.zsh/completion $fpath)
cd -

# 補完機能を有効化する
autoload -U compinit && compinit
