#!/usr/bin/env bash

WATCH_DIR="/mnt/c/New Career/my-bash-projects"
LOG_FILE="ci_cd.log"

mkdir -p "$WATCH_DIR"

echo "Starting CI/CD simulation for $WATCH_DIR..."
echo "Logging to $LOG_FILE"

while true; do
    # Wait for file changes in WATCH_DIR
    inotifywait -e modify,create,delete -r "$WATCH_DIR"
    
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$TIMESTAMP] Change detected! Running tests..." | tee -a "$LOG_FILE"
    
    # Simulated test: check if project files exist
    if [[ -n $(ls "$WATCH_DIR") ]]; then
        echo "[$TIMESTAMP] ✅ Tests passed!" | tee -a "$LOG_FILE"
    else
        echo "[$TIMESTAMP] ❌ Tests failed! No files found." | tee -a "$LOG_FILE"
    fi
    
    echo "------------------------" | tee -a "$LOG_FILE"
done
