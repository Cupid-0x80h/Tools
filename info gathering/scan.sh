#!/bin/bash

#check for the target ip is provided or not
if [ -z "$1" ]; then 
	echo "Usage : $0 <target_ip>"
	exit 1
fi

# perform the main scan

echo "Starting the NMAP scan on $1"
nmap -sS -sV -O --script=vuln -vv -T4 "$1"

#check for the scan was complete or not
if [ $? -eq 0 ]; then
	echo "Nmap scan is complete "
else
	echo "Nmap scan failed"
fi
