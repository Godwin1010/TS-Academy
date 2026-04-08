#!/bin/bash

# --- Setup & Strict Mode ---
set -uo pipefail # -e is omitted here to keep the menu loop running on minor errors
LOG_FILE="sys_tool.log"

# --- Helper Functions ---

log_action() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Action: $1" >> "$LOG_FILE"
}

greet_user() {
    read -p "What is your name? " username
    if [[ -z "$username" ]]; then
        echo "Error: Name cannot be empty."
        return 1
    fi
    echo "Hello, $username! Hope you're having a productive day."
    log_action "Greeted user: $username"
}

show_sys_info() {
    echo "--- Uptime ---"
    uptime
    echo -e "\n--- Disk Usage ---"
    df -h | grep '^/dev/'
    log_action "Viewed system info"
}

backup_file() {
    read -p "Enter the full path of the file to backup: " target_file
    if [[ ! -f "$target_file" ]]; then
        echo "Error: File '$target_file' not found."
        return 1
    fi

    BACKUP_DIR="backup_$(date +%F)"
    mkdir -p "$BACKUP_DIR"
    
    cp "$target_file" "$BACKUP_DIR/"
    if [[ $? -eq 0 ]]; then
        echo "Success! Backup stored in $BACKUP_DIR/"
        log_action "Backed up $target_file"
    else
        echo "Backup failed."
    fi
}

generate_password() {
    read -p "Enter desired password length: " len
    if [[ ! "$len" =~ ^[0-9]+$ ]] || [[ "$len" -lt 4 ]]; then
        echo "Error: Please enter a number (minimum 4)."
        return 1
    fi

    # Character set for the password
    charset='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$'
    password=""
    
    for (( i=0; i<len; i++ )); do
        index=$(( RANDOM % ${#charset} ))
        password="${password}${charset:$index:1}"
    done

    echo "Generated Password: $password"
    log_action "Generated a password of length $len"
}

# --- Main Menu Loop ---

echo "Welcome to the System Management Tool"
PS3="Please select an option: "

options=("Greet User" "System Info" "Backup File" "Password Generator" "Exit")

select opt in "${options[@]}"; do
    case $opt in
        "Greet User")
            greet_user
            ;;
        "System Info")
            show_sys_info
            ;;
        "Backup File")
            backup_file
            ;;
        "Password Generator")
            generate_password
            ;;
        "Exit")
            echo "Exiting. Check $LOG_FILE for session history."
            log_action "Session ended."
            break
            ;;
        *)
            echo "Invalid option. Try again."
            ;;
    esac
    echo -e "\n------------------------------------"
done

