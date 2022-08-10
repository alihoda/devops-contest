#!/bin/bash

COM=$1
IN=$2


if [ $COM == "bonus" ]
then
    while IFS="," read -r id city name phone salary addr
    do
        if [[ $id == $IN ]]
        then
            S=$(($salary * 5 / 100))
            printf "%s will get \$%.0f bonus\n" "$name" "$S"
        fi
    done < employee.csv
elif [ $COM == "city" ]
then
    while IFS="," read -r id city name phone salary addr
    do
        if [[ $city == $IN ]]
        then
            printf "Customer Name: %s\nMobile No: %s\n" "$name" "$phone"
        fi    
    done < employee.csv
else
    printf "command not found\n"
fi
