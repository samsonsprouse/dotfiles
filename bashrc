for d in $(find ~ -type d -maxdepth 1 -name ".bash*"); do
  for f in $(find $d ! -type d); do
    source "$f"
  done
done
