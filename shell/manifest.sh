function relative_source {
  DIR="${BASH_SOURCE%/*}"
  if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
  source "$DIR/$1"
}


relative_source "aliases/manifest.sh"
relative_source "completions/manifest.sh"
source "$DIR/path/manifest.sh"
source "$DIR/other/manifest.sh"

source "$DIR/bash.sh"
source "$DIR/rbenv.sh"
