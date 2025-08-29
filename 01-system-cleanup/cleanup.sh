DRY_RUN=true

#!/bin/bash
set -euo pipefail

echo "Report before cleaning:"
du -sh test_area

echo "Staring to clean ..."

#Find and delete files ending in .tmp
find test_area/ -type f -name "*.tmp" -delete

#Find and delete log files older than 7 days
find test_area/ -type f -name "*.log" -mtime +7 -delete

echo "Cleaning is finished!"

echo "Report after cleaning:"
du -sh test_area

if [ "$DRY_RUN" = true ]; then
    echo "🚨 DRY RUN MODE: No files will be deleted."
    echo "Cleaning temporary files..."
    find test_area/ -type f -name "*.tmp"
    echo "Cleaning log files..."
    find test_area/ -type f -name "*.log"
else
    echo "🟢 LIVE RUN MODE: Deleting files."
    echo "Cleaning temporary files..."
    find test_area/ -type f -name "*.tmp" -delete
    echo "Cleaning log files..."
    find test_area/ -type f -name "*.log" -delete
fi
