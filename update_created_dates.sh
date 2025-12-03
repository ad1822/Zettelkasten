#!/usr/bin/env bash

# Find all markdown files and iterate through them
find . -type f -name "*.md" | while IFS= read -r file; do
  # Check if the file contains a line starting with "Created:"
  if grep -q "^Created:" "$file"; then
    # Extract the date string from the first "Created:" line
    raw_date_str=$(grep -m1 "^Created:" "$file" | sed -E 's/^Created:[[:space:]]*//')

    # Remove ordinal suffixes: 1st, 2nd, 3rd, 4th,... 25th, etc.
    clean_date_str=$(printf '%s\n' "$raw_date_str" | sed -E 's/\b([0-9]{1,2})(st|nd|rd|th)\b/\1/')

    # Convert to YYYY-MM-DD format
    formatted_date=$(date -d "$clean_date_str" "+%Y-%m-%d" 2>/dev/null)

    if [ $? -eq 0 ] && [ -n "$formatted_date" ]; then
      # Remove the old "Created:" line from the file
      sed -i '/^Created:/d' "$file"

      # Insert created: "[[YYYY-mm-dd]]" after the first --- in the frontmatter
      awk -v date="$formatted_date" '
        BEGIN { done = 0 }
        /^---[[:space:]]*$/ && !done {
          print
          print "created: \"[[" date "]]\""
          done = 1
          next
        }
        { print }
      ' "$file" >"$file.tmp" && mv "$file.tmp" "$file"

      echo "Updated $file -> created: \"[[$formatted_date]]\""
    else
      echo "Could not parse date in $file: $raw_date_str"
    fi
  fi
done

echo "Script finished."
