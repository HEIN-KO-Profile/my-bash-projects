#!/usr/bin/env bash
# clean.sh — safe preview by default

set -euo pipefail

DRY_RUN=1        # 1 = only show, 0 = actually delete
DAYS=7           # files older than 7 days are candidates
LOG="cleanup.log"

# folders we look into (safe, mostly in your home)
TARGETS=("$HOME/.cache" "$HOME/Downloads" "/tmp")

# if user passed --apply, we switch to real deletion
if [[ "${1:-}" == "--apply" ]]; then
  DRY_RUN=0
fi

echo "=== Cleanup run (DRY_RUN=$DRY_RUN) ===" | tee -a "$LOG"

for dir in "${TARGETS[@]}"; do
  if [[ -d "$dir" ]]; then
    echo "Checking $dir ..." | tee -a "$LOG"
    # find files older than $DAYS (safe: files only)
    while IFS= read -r -d '' file; do
      echo "Candidate: $file" | tee -a "$LOG"
      if [[ $DRY_RUN -eq 0 ]]; then
        rm -f -- "$file" && echo "Removed: $file" | tee -a "$LOG"
      fi
    done < <(find "$dir" -type f -mtime +"$DAYS" -print0)
  fi
done

# short summary: how much space those folders use
du -sh "${TARGETS[@]}" 2>/dev/null | tee -a "$LOG"
echo "=== Done ===" | tee -a "$LOG"