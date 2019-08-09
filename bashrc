for d in $(find ~ -type d -maxdepth 1 -name ".bash"); do
  echo "sourcing all files under $d"
  for f in $(find $d ! -type d); do
    # echo "sourcing $f"
    source "$f"
  done
done
