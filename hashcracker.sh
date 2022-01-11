#!/bin/bash
figlet -f slant HASHCRACK
echo -e 'Auther:\e[3mDutchm3n\e[0m                                          hashcracker..! v0.01' | grep --color 'v0.01' | grep --color 'Dutchm3n'
echo -e "$(tput setaf 7)\e[3m###################################################################################\e[0m"
sleep 2
read -p "Enter The Hash:" -r hash
sleep 1
read -p "Wordfile Path:" -r file
sleep 1
read -p "Type:" -r type
sleep 1
read -p "Enter the Salt:" -r salt
echo -e "$(tput setaf 1)\e[3mStart cracking.....\e[0m"
sleep 1
while read -r line; do
    en=$(openssl passwd -$type -salt $salt $line)
    if [[ $en == "$hash" ]]; then
        echo -e "\e[1mPASSWORD FOUND:-\e[0m \x1B[31m'$line'\e[0m"
        echo -e "\e[3m\e[1mBYE....\e[0m"
        exit
    else
        echo -e "Checking:-$(tput setaf 7)'$line'"
    fi
done < "$file"



