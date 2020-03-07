# .bashrcの実行（存在する場合）
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# rbenv
eval "$(rbenv init -)"
