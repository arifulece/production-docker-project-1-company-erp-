#!/bin/bash
log_file="/var/log/user-managment/userlock.log"

log_message(){
	echo "[$(date)] $1" >> "$log_file"
}

# ===== Function: Lock User =====
lock_user() {
    read -p "Enter username to lock: " USER

    if id "$USER" &>/dev/null; then
        usermod -L "$USER"
        echo "User $USER locked"
        log_message "User locked: $USER"
    else
        echo "User not found"
    fi
}

# ===== Function: Unlock User =====
unlock_user() {
    read -p "Enter username to unlock: " USER

    if id "$USER" &>/dev/null; then
        usermod -U "$USER"
        echo "User $USER unlocked"
        log_message "User unlocked: $USER"
    else
        echo "User not found"
    fi
}

log_message "User managment script started"
lock_user
unlock_user
log_message "Script finished"

