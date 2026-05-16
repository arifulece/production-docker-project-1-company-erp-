#!/bin/bash
#=====Input from user=========
read -p "Enter your installation package name: " name

#=========check package ===========
yum list installed | grep $name
#=====OR Check======
if rpm -q "$name" &> /dev/null ;then
	echo "$name is already installed"
else
	echo "$name is not installed"
	#====Install package ===
	if sudo yum install -y $name; then
		echo "$name is installed successfully"
	else
		echo "Invalid package name"
	fi
fi

