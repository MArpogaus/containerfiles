#!/bin/bash
set -ouex pipefail

# Import the GPG key
rpm --import https://repo.cider.sh/RPM-GPG-KEY

# Create repository file
tee /etc/yum.repos.d/cider.repo << 'EOF'
[cidercollective]
name=Cider Collective Repository
baseurl=https://repo.cider.sh/rpm/RPMS
enabled=1
gpgcheck=1
gpgkey=https://repo.cider.sh/RPM-GPG-KEY
EOF

# Refresh package cache
dnf makecache

# Install Cider
dnf install -y Cider pipewire

# Clean up
dnf clean all
