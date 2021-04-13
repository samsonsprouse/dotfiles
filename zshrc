# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export LSCOLORS=ExFxBxDxCxegedabagacad 

alias grep='grep --color=auto'
alias gi='grep -i'
alias gv='grep -v'                    # Exclusive grep.
alias gvi='grep -vi'                  # Exclusive grep sans case-sensitivity.

alias ls='ls -G'                  # remap ls with colors
alias lh='ls -cd .*'              # Hidden files only.
alias ll='ls -lh'                 # Long list.
alias la='ls -ca'                 # List everything.
alias ld='ls -cd */'              # Directories only.
alias lda='ls -cda */'            # Directories only (including hidden ones).
alias ldh='ls -cda .*/'           # Hidden directories only.
alias lf='ls -p | grep -v "/$"'   # Files only.
alias lfa='ls -ap | grep -v "/$"' # Files only (including hidden ones).

