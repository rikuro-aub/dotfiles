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
alias gts='git status'
alias gtlo='git log --oneline'

# nvm
#export NVM_DIR=~/.nvm
#source $(brew --prefix nvm)/nvm.sh
#nvm alias default node

#Android Studioの設定
export ANDROID_SDK=$HOME/Library/Android/sdk
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH

# gitコマンドの補完設定
mkdir -p ~/.zsh/completion

if [[ ! -f  ~/.zsh/completion/git-completion.bash ]]; then
  curl \
    -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
    -o ~/.zsh/completion/git-completion.bash
fi

if [[ ! -f  ~/.zsh/completion/_git ]]; then
  curl \
    -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh \
    -o ~/.zsh/completion/_git
fi

fpath=(~/.zsh/completion $fpath)

# dockerコマンドの補完設定
etc=/Applications/Docker.app/Contents/Resources/etc
docker_completion_file=$etc/_docker
dockercompose_completion_file=$etc/docker-compose.zsh-completion
docker_completion_link=/usr/local/share/zsh/site-functions/_docker
dockercompose_completion_link=/usr/local/share/zsh/site-functions/_docker-compose

if [ -f $docker_completion_file -a ! -f $docker_completion_link ]; then
  ln -s $docker_completion_file $docker_completion_link
fi

if [ -f $dockercompose_completion_file -a ! -f $dockercompose_completion_link ]; then
  ln -s $dockercompose_completion_file $dockercompose_completion_link
fi

# 補完機能を有効化する
autoload -U compinit && compinit

# homebrewのpathをとおす
if [ -e /opt/homebrew ]; then
  export PATH="$PATH:/opt/homebrew/bin"
fi

# homebrewからasdfをinstallした場合に必要な設定
if [ -e /opt/homebrew ] && [ -f $(brew --prefix asdf)/libexec/asdf.sh ]; then
  source $(brew --prefix asdf)/libexec/asdf.sh
fi

# vimカラースキームを設置するディレクトリを作成
if [ ! -e $HOME/.vim/colors ]; then
  mkdir -p $HOME/.vim/colors/
fi

# vimカラースキームのダウンロードと設置
if [ ! -f $HOME/.vim/colors/hybrid.vim ]; then
  curl -OL https://github.com/w0ng/vim-hybrid/archive/refs/heads/master.zip
  unzip ./master.zip
  cp ./vim-hybrid-master/colors/hybrid.vim $HOME/.vim/colors
  rm -rf ./vim-hybrid-master
  rm -f ./master.zip
fi

# .console-ninjaのpathをとおす
if [ -e $HOME/.console-ninja ]; then
  PATH=$HOME/.console-ninja/.bin:$PATH
fi
