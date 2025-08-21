#!/bin/bash
set -ouex pipefail

# Import the GPG key
curl -fsSL https://repo.cider.sh/APT-GPG-KEY | gpg --dearmor -o /usr/share/keyrings/cider-archive-keyring.gpg

# Add the repository to sources list
echo "deb [signed-by=/usr/share/keyrings/cider-archive-keyring.gpg] https://repo.cider.sh/apt stable main" | tee /etc/apt/sources.list.d/cider.list

# Update package cache
apt update

# Install Cider
apt install -y cider pipewire

# Clean up
apt clean
rm -rf /var/lib/apt/lists/*
