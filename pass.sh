#!/bin/bash

echo "Enter the password length (default is 12 characters): "
read LENGTH

LENGTH=${LENGTH:-12}

PASSWORD=$(openssl rand -base64 $LENGTH)

echo "Generated Password: $PASSWORD"
