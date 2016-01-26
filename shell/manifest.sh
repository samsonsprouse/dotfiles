DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

source "$DIR/aliases/manifest.sh"
source "$DIR/completions/manifest.sh"
source "$DIR/path/manifest.sh"
source "$DIR/other/manifest.sh"

source "$DIR/bash.sh"
source "$DIR/rbenv.sh"
