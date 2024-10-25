#!/bin/bash

#function to display the wordlist menu
display_menu(){
	echo "Select a wordlist to use:"
	echo "1. Common wordlist "/usr/share/wordlists/dirb/common.txt""
	echo "2. Custom wordlist"
	echo "3. Small wordlist "/usr/share/wordlists/dirb/small.txt""
	echo "4. Big wordlist "/usr/share/wordlists/dirb/big.txt""
}

#Function to run gobuster
run_gobuster(){
	local url="$1"
	local wordlist="$2"

	echo "Starting gobuster scan on $url..."
	gobuster dir -u "$url" -w "$wordlist" -t 50 -x php,html
}

#main
echo "Enter the url : "
read url

display_menu
read -p "Enter your choice for wordlist: " choice

case $choice in 
	1)
		wordlist="/usr/share/wordlists/dirb/common.txt"
		;;
	2) 
		read -p "Enter the path of your wordlist: "wordlist
		;;
	3)
		wordlist="/usr/share/wordlists/dirb/small.txt"	
		;;
	4)
		wordlist="/usr/share/wordlists/dirb/big.txt"
		;;

	*)
		echo "Invalid choice"
		exit 1 
		;;

esac

run_gobuster "$url" "$wordlist"
