#!/bin/bash

# Function to remove existing SSH keys
remove_existing_keys() {
    if [ -f "$HOME/.ssh/id_rsa" ] || [ -f "$HOME/.ssh/id_rsa.pub" ]; then
        echo "Existing SSH keys found. Removing them..."
        rm -f "$HOME/.ssh/id_rsa" "$HOME/.ssh/id_rsa.pub"
        echo "Existing keys removed."
    else
        echo "No existing SSH keys found."
    fi
}

# Function to generate new SSH keys
generate_ssh_key() {
    ssh-keygen -t rsa -b 4096 -C "$email" -f "$HOME/.ssh/id_rsa" -N "$passphrase"
    echo "New SSH key generated."
}

# Ensure ~/.ssh directory exists
mkdir -p "$HOME/.ssh"

# Remove existing keys and generate new ones
remove_existing_keys
generate_ssh_key
