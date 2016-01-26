DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

source "$DIR/git.sh"
source "$DIR/rvm.sh"
source "$DIR/scripts.sh"