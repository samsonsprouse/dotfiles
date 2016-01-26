DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

source "$DIR/grep.sh"
source "$DIR/ls.sh"
source "$DIR/postgres.sh"
