init_vim() {
  if which vim &> /dev/null && ! [ -d $HOME/.vim/bundle/vundle ]; then
    vim || [ -d $HOME/.vim/bundle/vundle ]
  fi
}
mkdir -p ~/.vim/.backup/
mkdir -p ~/.vim/.swap/
mkdir -p ~/.vim/.undo/