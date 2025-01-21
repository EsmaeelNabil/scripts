#!/bin/bash

# Initialize variables
search_dir=""
extensions=""
output_file=""

# Parse arguments
while getopts "p:e:o:" opt; do
  case $opt in
  p) search_dir="$OPTARG" ;;
  e) extensions="$OPTARG" ;;
  o) output_file="$OPTARG" ;;
  *)
    echo "Fetch content of files with specific extensions in a directory"
    echo "Usage: $0 -p <search_dir> -e <extensions (comma-separated)> [-o output_file]"
    exit 1
    ;;
  esac
done

# Validate required arguments
if [[ -z "$search_dir" || -z "$extensions" ]]; then
  echo "Fetch content of files with specific extensions in a directory"
  echo "Usage: $0 -p <search_dir> -e <extensions (comma-separated)> [-o output_file]"
  exit 1
fi

# Convert comma-separated extensions into multiple -e arguments for fd
fd_extensions=""
IFS=',' read -ra ext_list <<<"$extensions"
for ext in "${ext_list[@]}"; do
  fd_extensions+="-e $ext "
done

# Function to output content
output_content() {
  if [[ -n "$output_file" ]]; then
    echo "$1" >>"$output_file"
  else
    echo "$1"
  fi
}

# Clear the output file if specified
if [[ -n "$output_file" ]]; then
  >"$output_file"
fi

# Find files and process them
eval fd $fd_extensions --base-directory "$search_dir" --type f | while read -r file; do
  output_content "=== $file ==="
  output_content "$(cat "$search_dir/$file")"
  output_content ""
done
