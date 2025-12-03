#!/usr/bin/env bash

ROOT_DIR="."

css_block="cssclasses:
  - center-images
  - center-titles"

find "$ROOT_DIR" -type f -name "*.md" | while read -r file; do
  modified=0

  # ---------------------------------------------------------
  # 1) Quote created: [[...]] -> created: "[[...]]"
  #    but only in files with the specific cssclasses block
  # ---------------------------------------------------------
  if grep -Fq "$css_block" "$file"; then
    if grep -Eq '^created:\s*\[\[.*\]\]$' "$file"; then
      sed -i 's/^\(created:\s*\)\(\[\[.*\]\]\)$/\1"\2"/' "$file"
      echo "Quoted created wikilink in: $file"
      modified=1
    fi
  fi

  # ---------------------------------------------------------
  # 2) Handle "Created: ..." lines with arbitrary date/time
  # ---------------------------------------------------------
  created_line=$(grep -E '^Created:' "$file" | head -n 1 || true)

  if [ -n "$created_line" ]; then
    # Strip the "Created: " prefix
    human_date=${created_line#Created: }
    human_date=$(echo "$human_date" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

    # Strip ordinal suffixes: 1st, 2nd, 3rd, 4th -> 1,2,3,4
    clean_date=$(echo "$human_date" | sed -E 's/\b([0-9]{1,2})(st|nd|rd|th)\b/\1/g')

    # Parse to ISO date (YYYY-MM-DD); requires GNU date
    iso_date=$(date -d "$clean_date" +%Y-%m-%d 2>/dev/null || true)

    if [ -z "$iso_date" ]; then
      echo "WARNING: Could not parse date in: $file"
      echo "  raw:   $human_date"
      echo "  clean: $clean_date"
    else
      echo "Normalizing Created date in: $file -> $iso_date"

      # Remove all Created: ... lines
      sed -i '/^Created:/d' "$file"

      # Check if file has YAML frontmatter (any line exactly "---")
      if grep -qx '---' "$file"; then
        # Insert created: "[[YYYY-MM-DD]]" into existing YAML if not present
        awk -v new="created: \"[[$iso_date]]\"" '
                BEGIN {
                    in_yaml = 0
                    inserted = 0
                }
                NR == 1 && $0 == "---" {
                    in_yaml = 1
                }
                {
                    if (in_yaml && $0 ~ /^created:/) {
                        inserted = 1
                    }

                    # Before closing frontmatter (second ---), inject created if missing
                    if (in_yaml && $0 == "---" && NR != 1) {
                        if (!inserted) {
                            print new
                        }
                        in_yaml = 0
                    }

                    print
                }
                ' "$file" >"$file.tmp" && mv "$file.tmp" "$file"
      else
        # No YAML frontmatter: create one at the top
        tmp="$(mktemp)"
        {
          echo "---"
          echo "created: \"[[$iso_date]]\""
          echo "---"
          cat "$file"
        } >"$tmp"
        mv "$tmp" "$file"
      fi

      modified=1
    fi
  fi
done
