#!/bin/bash

echo "Date Formate"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

echo "Source and Destination"
src="/var/www/html"
dst="/root/enterprise-linux/backup"

echo "Create Backup"
tar -czf "$dst/www_backup_$DATE.tar.gz" "$src"

echo "Delete backup older 7 days"
find "$dst" -type f -name "*.tar.gz" -mtime +7 -delete

echo "done"
