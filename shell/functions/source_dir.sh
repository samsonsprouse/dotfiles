# wont work for files that contain spaces
function source_dir {
    find ~/.gs -type f -name "*.sh" | while read f; do
      source "$f"
    done;
}