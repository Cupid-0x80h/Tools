#!/bin/bash
caesar_encrypt() {
  local input=$1
  local shift=$2
  local result=""

  for ((i=0; i<${#input}; i++)); do
    local char=${input:$i:1}
    if [[ $char =~ [a-zA-Z] ]]; then
      local ascii_offset=65
      if [[ $char =~ [a-z] ]]; then
        ascii_offset=97
      fi
      local new_char=$(printf "\\$(printf "%03o" $(( ($(printf "%d" "'$char") - $ascii_offset + $shift) % 26 + $ascii_offset )))")
      result+=$new_char
    else
      result+=$char
    fi
  done

  echo "$result"
}
caesar_decrypt() {
  local input=$1
  local shift=$2
  local result=""

  for ((i=0; i<${#input}; i++)); do
    local char=${input:$i:1}
    if [[ $char =~ [a-zA-Z] ]]; then
      local ascii_offset=65
      if [[ $char =~ [a-z] ]]; then
        ascii_offset=97
      fi
      local new_char=$(printf "\\$(printf "%03o" $(( ($(printf "%d" "'$char") - $ascii_offset - $shift) % 26 + $ascii_offset )))")
      result+=$new_char
    else
      result+=$char
    fi
  done

  echo "$result"
}

clear
echo "Caesar Cipher Program"
echo "---------------------"
echo "1. Encrypt"
echo "2. Decrypt"
echo -n "Choose an option: "
read option

case $option in
  1)
    echo -n "Enter the text to encrypt: "
    read input
    echo -n "Enter the shift value: "
    read shift
    result=$(caesar_encrypt "$input" "$shift")
    echo "Encrypted text: $result"
    ;;
  2)
    echo -n "Enter the text to decrypt: "
    read input
    echo -n "Enter the shift value: "
    read shift
    result=$(caesar_decrypt "$input" "$shift")
    echo "Decrypted text: $result"
    ;;
  *)
    echo "Invalid option"
    ;;
esac