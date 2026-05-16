#!/bin/bash
#========variable =======
log_file="/var/log/user-managment/user.log"

mkdir -p /var/log/user-managment

#====function: log===========
log_message(){
        echo "[$(date)] $1" >> "$log_file"
}
#===========user create function===========
create_user(){
read -p "Enter your name:" user

if id "$user" &>/dev/null; then
        echo "User already exists"
        log_message "Failed: User $user already exists"
else
        useradd "$user"
        echo "Enter password for $user"
        passwd "$user"
        echo "User $user created successfully"
        log_message "Success: user $user created"
fi
}

#========Fuction: user delete=========
delete_user(){
read -p "Enter your delete user name: " user

if id "$user" &>/dev/null; then
        userdel -r $user
        echo "Delete user name is: $user"
        log_message "user deleted: $user"
else
        echo "$user does not exist"
        log_message "Delete user failed: $user not found"
fi
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

#======Menu========
while true; do
	echo "======User Managment======="
	echo "1. Create user"
	echo "2. Delete user"
	echo "3. Lock user"
	echo "4. Unlock User"
	echo "5. Exit"
	read -p "Choose option: " CHOICE

	case $CHOICE in
		1) create_user;;
		2) delete_user;;
		3) lock_user;;
		4) unlock_user;;
		5) exit 0;;
		*) echo "Invalid option" ;;
	esac
done


