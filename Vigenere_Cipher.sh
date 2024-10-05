#!/bin/bash

encrypt() {
    local msg=$1
    local key=$2
    local encrypted=""
    local key_index=0
    local key_length=${#key}

    for ((i=0; i<${#msg}; i++)); do
        char=${msg:$i:1}
        
        if [[ "$char" =~ [A-Za-z] ]]; then
            shift_val=$(printf '%d' "'${key:key_index:1}")
            shift_val=$((shift_val % 32 - 1)) # Key letter shift (A=0, B=1, etc.)
            
            if [[ "$char" =~ [A-Z] ]]; then
                encrypted+=$(printf \\$(printf '%03o' $(( ( $(printf '%d' "'$char") + shift_val - 65 ) % 26 + 65 ))))
            elif [[ "$char" =~ [a-z] ]]; then
                encrypted+=$(printf \\$(printf '%03o' $(( ( $(printf '%d' "'$char") + shift_val - 97 ) % 26 + 97 ))))
            fi

            key_index=$(( (key_index + 1) % key_length ))
        else
            encrypted+="$char"
        fi
    done

    echo "$encrypted"
}


decrypt() {
    local msg=$1
    local key=$2
    local decrypted=""
    local key_index=0
    local key_length=${#key}

    for ((i=0; i<${#msg}; i++)); do
        char=${msg:$i:1}

        if [[ "$char" =~ [A-Za-z] ]]; then
            shift_val=$(printf '%d' "'${key:key_index:1}")
            shift_val=$((shift_val % 32 - 1)) # Key letter shift (A=0, B=1, etc.)

            if [[ "$char" =~ [A-Z] ]]; then
                decrypted+=$(printf \\$(printf '%03o' $(( ( $(printf '%d' "'$char") - shift_val - 65 + 26 ) % 26 + 65 ))))
            elif [[ "$char" =~ [a-z] ]]; then
                decrypted+=$(printf \\$(printf '%03o' $(( ( $(printf '%d' "'$char") - shift_val - 97 + 26 ) % 26 + 97 ))))
            fi

            key_index=$(( (key_index + 1) % key_length ))
        else
            decrypted+="$char"
        fi
    done

    echo "$decrypted"
}

# Main menu
echo "Vigenère Cipher Program"
echo "1. Encrypt"
echo "2. Decrypt"
read -p "Choose an option (1 or 2): " choice

if [[ "$choice" == "1" ]]; then
    read -p "Enter the message to encrypt: " msg
    read -p "Enter the encryption key (alphabetic only): " key
    echo "Encrypted message: $(encrypt "$msg" "$key")"
elif [[ "$choice" == "2" ]]; then
    read -p "Enter the message to decrypt: " msg
    read -p "Enter the decryption key (alphabetic only): " key
    echo "Decrypted message: $(decrypt "$msg" "$key")"
else
    echo "Invalid option."
fi

