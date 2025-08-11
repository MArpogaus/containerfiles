#!/bin/bash
set -ouex pipefail

curl 'https://archlinux.org/mirrorlist/?protocol=https&ip_version=4&use_mirror_status=on?country=US' | sed 's:#Server:Server:' | grep -v '^#' | head -n 25 > /tmp/mirrorlist
rankmirrors -n 5 /tmp/mirrorlist | tee /etc/pacman.d/mirrorlist

echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
locale-gen

curl -s https://repo.cider.sh/ARCH-GPG-KEY | pacman-key --add -
pacman-key --lsign-key A0CD6B993438E22634450CDD2A236C3F42A61682

tee -a /etc/pacman.conf << EOF

# Cider Collective Repository
[cidercollective]
SigLevel = Required TrustedOnly
Server = https://repo.cider.sh/arch
EOF

pacman -Syyu --noconfirm
pacman -S --noconfirm cider
pacman -Scc --noconfirm
