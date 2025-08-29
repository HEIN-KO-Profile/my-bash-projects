#!/usr/bin/env bash
# backup.sh — v0.1
# Makes a backup of a folder and can restore it

BACKUP_DIR="$(pwd)/backups"   # where we’ll keep the backpacks
mkdir -p "$BACKUP_DIR"

echo "Do you want to [b]ackup or [r]estore?"
read action

if [[ "$action" == "b" ]]; then
  echo "Which folder do you want to backup?"
  read folder
  if [[ -d "$folder" ]]; then
    timestamp=$(date +%Y-%m-%d_%H-%M-%S)
    filename="backup-$timestamp.tar.gz"
    tar -czf "$BACKUP_DIR/$filename" "$folder"
    echo "✅ Packed $folder into $BACKUP_DIR/$filename"
  else
    echo "❌ That folder doesn’t exist."
  fi
elif [[ "$action" == "r" ]]; then
  echo "Available backups:"
  ls "$BACKUP_DIR"
  echo "Which one do you want to restore?"
  read file
  if [[ -f "$BACKUP_DIR/$file" ]]; then
    tar -xzf "$BACKUP_DIR/$file" -C "$HOME"
    echo "✅ Unpacked $file into your home folder."
  else
    echo "❌ That file doesn’t exist."
  fi
else
  echo "Please type b or r"
fi