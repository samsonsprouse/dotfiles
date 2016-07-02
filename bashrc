for f in $(find .bash* -path '.bash*/*' ! -type d); do source "$f"; done
