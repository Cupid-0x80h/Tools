#!/bin/bash

# List of websites or IPs to check
targets=("google.com" "github.com" "tryhackme.com" "youtube.com")

# Log file to store the results
log_file="connectivity.log"

# Function to check connectivity
check_connectivity() {
    echo "Checking connectivity for ${#targets[@]} targets..."
    echo "===== Connectivity Check: $(date) =====" >> "$log_file"

    for target in "${targets[@]}"; do
        # Ping the target 3 times
        if ping -c 3 -q "$target" &> /dev/null; then
            echo "$target is reachable."
            echo "$target is reachable." >> "$log_file"
        else
            echo "$target is NOT reachable."
            echo "$target is NOT reachable." >> "$log_file"
        fi
    done

    echo "Results logged in $log_file"
}

# Call the function
check_connectivity
