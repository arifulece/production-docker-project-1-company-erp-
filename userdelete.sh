#!/bin/bash
log_file="/var/log/user-managment/deleteuser.log"

log_message(){
	echo "[$(date)] $1">> "$log_file"

}
user_delete(){
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

log_message "User Managment script started"
user_delete
log_message "script finished"

