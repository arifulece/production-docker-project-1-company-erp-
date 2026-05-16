#!/bin/bash
#=====All server IP ping checker==========
for server_ip in $(cat server_ip_list.txt); do
       if ping -c 2 $server_ip; then
	       echo "$server_ip is running"
       else
	       echo "$server_ip is down"
       fi
done


