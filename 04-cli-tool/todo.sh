#!/usr/bin/env bash

TASK_FILE="tasks.txt"

# Colors
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

add_task() {
    if [[ -z "$1" ]]; then
        echo -e "${RED}Cannot add empty task!${RESET}"
        return 1
    fi
    echo "$1" >> "$TASK_FILE"
    echo -e "${GREEN}Added task:${RESET} $1"
}


list_tasks() {
    if [[ ! -s "$TASK_FILE" ]]; then
        echo -e "${YELLOW}No tasks yet!${RESET}"
        return
    fi
    echo -e "${GREEN}Your tasks:${RESET}"
    nl -w2 -s". " "$TASK_FILE"
}

remove_task() {
    if [[ -z "$1" ]]; then
        echo -e "${RED}Please provide a task number to remove.${RESET}"
        exit 1
    fi
    sed -i "${1}d" "$TASK_FILE"
    echo -e "${GREEN}Removed task #$1${RESET}"
}

clear_tasks() {
    > "$TASK_FILE"
    echo -e "${GREEN}All tasks cleared!${RESET}"
}

show_help() {
    echo "Todo CLI Tool"
    echo "Usage: $0 [command] [args]"
    echo
    echo "Commands:"
    echo "  add [task]       Add a new task"
    echo "  list             Show all tasks"
    echo "  remove [number]  Remove task by number"
    echo "  clear            Clear all tasks"
    echo "  help             Show this help menu"
}

# Parse command
case "$1" in
    add) shift; add_task "$*";;
    list) list_tasks;;
    remove) shift; remove_task "$1";;
    clear) clear_tasks;;
    help|*) show_help;;
esac