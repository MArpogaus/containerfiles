#!/bin/bash
set -ouex pipefail

### Install packages
dnf5 install -y zsh

### Enable systemd-homed
TMP_DIR=/tmp/homed-selinux
git clone https://github.com/richiedaze/homed-selinux $TMP_DIR

# Build and install SELinux custom policy
cd $TMP_DIR
make -f /usr/share/selinux/devel/Makefile homed.pp
semodule --install=homed.pp

# Set file context
restorecon -rv \
    /usr/lib/systemd/systemd-homed \
    /usr/lib/systemd/systemd-homework \
    /usr/lib/systemd/system/systemd-homed.service \
    /usr/lib/systemd/system/systemd-homed-activate.service \
    /var/lib/systemd/home

# Add public key
cp /ctx/local.public /var/lib/systemd/home/

# Enable the authselect profile feature and the systemd service
authselect enable-feature with-systemd-homed
sudo systemctl enable systemd-homed