#!/bin/bash
set -ouex pipefail

### Notes
# https://blue-build.org/blog/preferring-system-etc
# /etc/ files in the image are copied to /usr/etc/ during deployment.
# At run-time the /usr/etc/ directory then contains the original configuration of the image.

### Install packages
dnf5 install -y zsh

# Clean dnf caches
dnf clean all

### Add public cosign key
cd /tmp

# Create a registry configuration file:
cat >/etc/containers/registries.d/ghcr.io-marpogaus.yaml <<EOF
docker:
  ghcr.io/marpogaus:
    use-sigstore-attachments: true
EOF

# Download and install the public key:
curl -o /etc/pki/containers/marpogaus-cosign.pub https://raw.githubusercontent.com/marpogaus/containerfiles/main/cosign.pub

# Update container policy to allow signed images from this repository
POLICY_FILE="/etc/containers/policy.json"

jq --arg image_registry "ghcr.io/marpogaus" \
	--arg image_registry_key "marpogaus-cosign" \
	'.transports.docker |=
    { $image_registry: [
        {
            "type": "sigstoreSigned",
            "keyPath": ("/etc/pki/containers/" + $image_registry_key + ".pub"),
            "signedIdentity": {
                "type": "matchRepository"
            }
        }
    ] } + .' "${POLICY_FILE}" >POLICY.tmp

cp POLICY.tmp /etc/containers/policy.json
rm POLICY.tmp

### Add custom distrobox config
cd /tmp
tee >>/etc/distrobox/distrobox.ini <<EOF

# My custom images
EOF

for d in cider-arch emacs-arch latex-arch; do
	tee >>/etc/distrobox/distrobox.ini <<EOF
[$d]
image=ghcr.io/marpogaus/$d
pull=true
replace=true
pre_init_hooks="update-mirrors DE"
EOF
done

### Enable systemd-homed
authselect enable-feature with-systemd-homed
systemctl enable systemd-homed

### Copy additional system files
rsync -rzP --chown=root:root /ctx/sysroot/ /

### Add additional policy for usbguard and relabel system
semodule --install=/ctx/usbguard-daemon.pp
restorecon \
	-e /dev \
	-e /mnt \
	-e /proc \
	-e /run \
	-e /sys \
	-e /tmp \
	-vRF /
