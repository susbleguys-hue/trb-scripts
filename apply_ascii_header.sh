#!/usr/bin/env bash
set -euo pipefail

HEADER=$'pcall(function()\nlocal art = [[████████╗██████╗ ██████╗ \n╚══██╔══╝██╔══██╗██╔══██╗\n   ██║   ██████╔╝██████╔╝\n   ██║   ██╔══██╗██╔══██╗\n   ██║   ██║  ██║██████╔╝\n   ╚═╝   ╚═╝  ╚═╝╚═════╝]]\n\nprint("|" .. (art:gsub("\\n", "\\n|")))\nend)\n'

mapfile -t files < <(git ls-files '*.lua' 2>/dev/null || find . -type f -name '*.lua' ! -name 'README.md')

if [ "${#files[@]}" -eq 0 ]; then
  echo "No .lua files found."
  exit 0
fi

for file in "${files[@]}"; do
  [ -f "$file" ] || continue
  case "$file" in
    README.md) continue ;;
  esac

  if grep -Fq 'local art = [[' "$file"; then
    echo "Skipping $file (already has header)"
    continue
  fi

  tmp=$(mktemp)
  printf '%s\n\n' "$HEADER" > "$tmp"
  cat "$file" >> "$tmp"
  mv "$tmp" "$file"
  echo "Updated $file"
done

echo "Done."
