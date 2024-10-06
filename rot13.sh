#!/bin/bash

echo "Enter your string here: "

read string

echo "What do you want to do?\n Encode(0) or Decode(1) "

read choice

if [ $choice -eq 0 ]
then 
        encoded_string=$(echo "$string" | tr 'a-zA-Z' 'n-za-mN-ZA-M')
        echo "Rot 13 encoded string : $encoded_string"
elif [ $choice -eq 1 ]
then                                                                                                  
        decoded_string=$(echo "$string" | tr 'n-za-mN-ZA-M' 'a-zA-Z')                                 
        echo "Rot 13 decoded string : $decoded_string"                                                
else                                                                                                  
        echo "Wrong input"                                                                            
fi
