#!/bin/bash
#===1Way form inpur user======
#read -p "Enter your service name: " service

#if systemctl is-active --quiet  $service; then
#	echo "$service is running"
#else
#	echo "$serice is stopped"
#fi

#=====way 2 from service list=======

for service in $(cat service_list.txt); do
	if systemctl is-active --quiet $service; then
		echo "$service is running successfully"
	else
		echo "$service is stopped"
	fi
done

