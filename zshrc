# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/samson/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


source ~/.zsh/antigen.zsh
source ~/.bash/shell_prompt

antigen use oh-my-zsh
antigen bundle ruby
antigen bundle gem
antigen bundle bundler
antigen bundle rails
antigen bundle git
antigen bundle brew
antigen bundle command-not-found
antigen bundle fasd
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply
