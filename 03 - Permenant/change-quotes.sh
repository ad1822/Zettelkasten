#!/usr/bin/env bash

ROOT_DIR="."

css_block="cssclasses:
  - center-images
  - center-titles"

# Find all .md files and process them
find "$ROOT_DIR" -type f -name "*.md" | while read -r file; do
  # Check if file contains the cssclasses block
  if grep -Fq "$css_block" "$file"; then
    # Check for unquoted created line
    if grep -Eq '^created:\s*\[\[.*\]\]$' "$file"; then
      echo "Updating: $file"

      # Replace created: [[...]] → created: "[[...]]"
      sed -i 's/^\(created:\s*\)\(\[\[.*\]\]\)$/\1"\2"/' "$file"
    fi
  fi
done
