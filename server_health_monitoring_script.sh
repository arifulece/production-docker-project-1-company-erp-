#!/bin/bash
#====Monitoring folder create=======
mkdir -p /var/log/monitoring

#=========variables apply==========
log_file="/var/log/monitoring/health.log"
date=$(date "+%Y-%m-%d %H:%M:%S")

#=====Threshold range variables=============
cpu_thershold=80
mem_threshold=80
disk_threshold=80

#======CPU usages check ========
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')

#======Memory usages check =========

mem_usage=$(free -m | awk 'NR==2 {print $3*100/$2}')

#=========Diks usages==========
disk_usage=$(df -h | awk 'NR==7 {print $5}' | sed 's/%//')

#====CPU alert===========
if [ $cpu_usage -ge $cpu_threshold ]; then
	echo " Cpu Usage is High: $cpu_usage" >> $log_file
else
	echo " Cpu usages is normal: $cpu_usage" >> $log_file
fi

#======Memory Alert=================
if [ $mem_usage -ge $mem_threshold ]; then
	echo "Memory usages is High: $mem_usage" >> $log_file
else
	echo "Memory usages is Normal: $mem_usage" >> $log_file
fi

#=====Disk Aleart =============
if [ $disk_usage -ge $disk_thershold ]; then
	echo "Disk usages is High: $disk_usage" >> $log_file
else
	echo "Disk usages is Normal: $disk_usage" >> $log_file
fi


