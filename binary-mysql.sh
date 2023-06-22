#!/bin/bash

# Prompt for IP address
read -p "Enter the IP Address: " ip_address

# Validate IP address format
if ! [[ $ip_address =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
  echo "Invalid IP address format. Please provide a valid IP address."
  exit 1
fi

# Split the IP address into octets
IFS='.' read -ra octets <<< "$ip_address"

# Convert octets to binary format
binary_ip=""
for octet in "${octets[@]}"; do
  binary=$(printf "%08d" $(bc <<< "obase=2;$octet"))

  # Append binary octet to binary IP address
  binary_ip+="$binary."
done

# Remove the trailing dot
binary_ip=${binary_ip%?}

# Display the result in the expected format
echo "The binary format for IP Address $ip_address is: $binary_ip"
