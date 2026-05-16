#!/bin/bash
#========variable =======
log_file="/var/log/user-managment/user.log"

mkdir -p /var/log/user-managment

#====function: log====
log_message(){
	echo "[$(date)] $1" >> "$log_file"
}

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

log_message "User management script started"
create_user
log_message "script finished"


