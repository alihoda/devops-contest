#!/bin/bash

COM=$1
#FILE=$2

if [ $# -lt 2 ]
then
    printf "not enough arguments\n"

elif [[ $COM != "block" ]] && [[ $COM != "unblock" ]]
then
    printf "invalid command\n"
elif [ -e $2 ]
then
	FILE=$2
    if [ $COM == "block" ]
    then
        while read line
        do
            iptables -t filter -D INPUT -s $line -j DROP
            iptables -t filter -A INPUT -s $line -j DROP
        done < $FILE
    else
        while read line
        do
            iptables -t filter -D INPUT -s $line -j DROP
            iptables -t filter -A INPUT -s $line -j ACCEPT
        done < $FILE
    fi
else
    printf "ip list file not found\n"
fi



