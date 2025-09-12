#!/bin/bash
set -ouex pipefail

cp /ctx/update-mirrors /usr/bin/
update-mirrors US

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
