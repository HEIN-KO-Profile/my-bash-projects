#!/usr/bin/env bash

echo "Which log file do you want to analyze?"
read LOGFILE

if [[ ! -f "$LOGFILE" ]]; then
  echo "File not found!"
  exit 1
fi

# Count
ERRORS=$(grep -c "ERROR" "$LOGFILE")
WARNINGS=$(grep -c "WARNING" "$LOGFILE")
INFOS=$(grep -c "INFO" "$LOGFILE")

# Report name with today’s date
REPORT="report-$(date +%Y-%m-%d).txt"

# Write to both screen and file
{
  echo "Summary for $LOGFILE"
  echo "Date: $(date)"
  echo "Errors:   $ERRORS"
  echo "Warnings: $WARNINGS"
  echo "Info:     $INFOS"
} | tee "$REPORT"

echo "Report saved as $REPORT"

FIRST=$(head -n 1 "$LOGFILE" | cut -d" " -f1,2)
LAST=$(tail -n 1 "$LOGFILE" | cut -d" " -f1,2)

echo "First log entry: $FIRST"
echo "Last log entry:  $LAST"