#port M2_HOME=/usr/local/apache-maven-2.0.9

export PATH="$M2_HOME/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

rvm 1.9.2

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


###############################################################
# My version of bash prompt                                   #
###############################################################
prompt_command () {
    if [ $? -eq 0 ]; then # set an error string for the prompt, if applicable
        ERRPROMPT=" "
    else
        ERRPROMPT='-&gt;($?) '
    fi
    #if [ "\$(type -t __git_ps1)" ]; then # if we're in a Git repo, show current branch
    #    BRANCH="\$(__git_ps1 '[ %s ] ')"
    #fi
    local TIME=`fmt_time` # format time for prompt string
    local LOAD=`uptime|awk '{min=NF-2;print $min}'`
    # set the titlebar to the last 2 fields of pwd
    # local TITLEBAR='\[\e]2;`pwdtail`\a'
    # local TITLEBAR=`pwd`
    export PS1="\[${TITLEBAR}\][ \u@\
\h ${TIME} ]$ERRPROMPT \w\n$ "
}
PROMPT_COMMAND=prompt_command
 
fmt_time () { #format time just the way I likes it
    if [ `date +%p` = "PM" ]; then
        meridiem="pm"
    else
        meridiem="am"
    fi
    date +"%l:%M:%S$meridiem"|sed 's/ //g'
}


