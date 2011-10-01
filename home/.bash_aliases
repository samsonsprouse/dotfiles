# make MacVim open files in a new tab if MacVim is already open
# also, "replace" vim with MacVim
alias vim='open -a MacVim.app'

###############################################################
# Lists and greps.                                            #
###############################################################
alias ls='ls -G'                  # remap ls with colors
alias lh='ls -cd .*'              # Hidden files only.
alias ll='ls -lh'                 # Long list.
alias la='ls -ca'                 # List everything.
alias ld='ls -cd */'              # Directories only.
alias lda='ls -cda */'            # Directories only (including hidden ones).
alias ldh='ls -cda .*/'           # Hidden directories only.
alias lf='ls -p | grep -v "/$"'   # Files only.
alias lfa='ls -ap | grep -v "/$"' # Files only (including hidden ones).

alias grep='grep --color=auto'
alias gi='grep -i'
alias gv='grep -v'                    # Exclusive grep.
alias gvi='grep -vi'                  # Exclusive grep sans case-sensitivity.
