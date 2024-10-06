#!/bin/bash

echo "Enter your string here: "
read string

echo "What do you want to do?\n Encode(0) or Decode(1) "
read choice

if [ "$choice" -eq 0 ]
then
        encoded_string=$(echo "$string" | tr '!-~' 'P-~!-O')
        echo "Rot 47 encoded string : $encoded_string"
elif [ "$choice" -eq 1 ]
then
        decoded_string=$(echo "$string" | tr 'P-~!-O' '!-~')
        echo "Rot 47 decoded string : $decoded_string"
else
        echo "Wrong input"
fi
