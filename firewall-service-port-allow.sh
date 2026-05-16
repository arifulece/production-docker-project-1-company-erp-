#!/bin/bash

#=====Input port and service======
read -p "Type your service port (8080/tcp): " port

read -p "Type your service name: " service

#========check service============
if firewall-cmd --list-services | grep -w "$service" &>/dev/null
then
	echo "Service $service already allowed"
else
	firewall-cmd --permanent -add-service="$service"

	if [ $? -eq 0 ]; then
		echo " Service $service added successfully"
	else
		echo "Service $service is failed"
	fi
fi

#=======check port=======
if firewall-cmd --list-ports | grep -w "$port" &>/dev/null
then
	echo "Port $port already allowed"
else
	firewall-cmd --permanent --add-port="$port"

	if [ $? -eq 0 ]
	then
		echo "Port $port added successfully"
	else
		echo "Failed to add port"

	fi
fi

#====Reload Firewall ====
firewall-cmd --reload

echo "Firewall configuration update successfully"


