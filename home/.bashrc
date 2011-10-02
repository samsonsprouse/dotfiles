# ~/.bashrc: usually executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# *note* Not the case for Mac OSX, which executes ~/.bash_profile for non-login
# shells instead of ~/.bashrc. Therefore ~/.bashrc should be called from
# ~/.bash_profile

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

###############################################################
# Bash Aliases                                                #
###############################################################

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

###############################################################
# Path                                                        #
###############################################################

# set up maven
# export M2_HOME=/usr/local/apache-maven-2.0.9
export PATH="$M2_HOME/bin:$PATH"

###############################################################
# RVM (Ruby Version Manager)                                  #
###############################################################
# This loads RVM into a shell. 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Choose ruby version:
rvm 1.9.2

###############################################################
# Bash Configuration Tweaks                                   #
###############################################################

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


###############################################################
# Customize the bash prompt                                   #
###############################################################
prompt_command () {
    BLACK=$(tput setaf 0)
    WHITE=$(tput setaf 15)
    OFFWHITE=$(tput setaf 255)
    NORMAL=$(tput sgr0)
    GREEN=$(tput setaf 2)

    if [ $? -eq 0 ]; then # set an error string for the prompt, if applicable
        ERRPROMPT=" "
    else
        ERRPROMPT='-&gt;($?) '
    fi
    
    if [ `date +%p` = "PM" ]; then
        meridiem="pm"
    else
        meridiem="am"
    fi

    local gitbranch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\* \1 /'`

    local TIME=`date +"%l:%M:%S$meridiem"|sed 's/ //g'`
    local myprompt="\[${OFFWHITE}\]_________________________________________________________\n"
    myprompt=$myprompt"[\u@\h ${TIME}]$ERRPROMPT \w\n"
    myprompt=$myprompt"\[${GREEN}\]${gitbranch}\[${OFFWHITE}\]> \[${NORMAL}\]"

    export PS1=$myprompt
}
PROMPT_COMMAND=prompt_command
 
#print your terminal's ANSI colors for codes 0-256
print_colors () {
    ( x=`tput op` y=`printf %$((${COLUMNS}-6))s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done; )
}
