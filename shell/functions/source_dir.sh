# wont work for files that contain spaces
function source_dir {
    find $1 -type f -name "*.sh" | while read f; do
      source "$f"
    done;
}