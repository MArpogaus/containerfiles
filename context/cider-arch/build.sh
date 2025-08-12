#!/bin/bash
set -ouex pipefail

curl -s 'https://archlinux.org/mirrorlist/?protocol=https&ip_version=4&use_mirror_status=on?country=US' | grep Server | sed 's:#Server:Server:' | tee /etc/pacman.d/mirrorlist

curl -s https://repo.cider.sh/ARCH-GPG-KEY | pacman-key --add -
pacman-key --lsign-key A0CD6B993438E22634450CDD2A236C3F42A61682

tee -a /etc/pacman.conf <<EOF

# Cider Collective Repository
[cidercollective]
SigLevel = Required TrustedOnly
Server = https://repo.cider.sh/arch
EOF

pacman -Syyu --noconfirm
pacman -S --noconfirm cider pipewire-pulse
pacman -Scc --noconfirm
