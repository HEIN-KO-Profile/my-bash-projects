1. What we’re building

A script that:

Reads through a log file (like system.log or your app’s logs).

Finds lines with ERROR, WARNING, or INFO.

Counts how many times each appears.

Prints a small summary (like a mini-report).

Bonus later: Save the summary to a file (so you can look back) with timestamps.

2. Why it’s useful

Logs are like a diary for your computer — they tell what’s happening.

But they’re too long to read line by line.

This script helps you quickly spot problems (errors), risks (warnings), or normal notes (info).

3. How to start
Step A: Make a new folder

Inside your repo:

cd ~/my-bash-projects/03-log-analyzer
touch log-analyzer.sh
chmod +x log-analyzer.sh