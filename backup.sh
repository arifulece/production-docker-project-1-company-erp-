#!/bin/bash
#====Varaible declaration=====
#mkdir -p /root/real_life_bash_project [folder create command. if need we apply]
source_dir="/root/real_life_bash_project"
mkdir -p /root/backup-script
backup_dir="/root/backup-script"
mkdir -p /var/log/backup-script
log_file="/var/log/backup-script/backup.log"

date=$(date +"%Y-%m-%d_%H-%M")

backup_file="backup_$date.tar.gz"

#====Start Backup=======

echo "[$(date)] Backup Started" >> $log_file

tar -czf "$backup_dir/$backup_file" "$source_dir" 2>> $log_file

if [ $? -eq 0 ]; then
	echo "[$(date)] Backup Successful: $backup_file" >> $log_file
else
	echo "[$(date)] backup failed" >> $log_file
	exit 1
fi


# ===== Delete backups older than 7 days =====
find $backup_dir -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;

echo "[$(date)] Old backups cleaned" >> $log_file
echo "[$(date)] Backup finished" >> $log_file

exit 0

