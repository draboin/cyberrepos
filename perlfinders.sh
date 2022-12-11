#!/bin/bash

# Set the internal field separator to newline
IFS=$'\n'

# Find all files with the .pl extension
files=$(find / -name "*.pl" -type f)

# Loop through the files
for file in $files; do
  # Check for common Perl backdoor patterns
  if grep -q "eval *( *base64_decode" "$file" ||
     grep -q "perl -MIO -e" "$file" ||
     grep -q "perl -e 'use Socket'" "$file"; then
    # Print the filename and path of any potential backdoors
    echo "$file"
  fi
done
