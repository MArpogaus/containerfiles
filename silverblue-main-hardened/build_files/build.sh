#!/bin/bash
set -ouex pipefail

### Install packages
dnf5 install -y zsh

### Add public cosign key
cd /tmp

# Create a registry configuration file:
cat > /usr/etc/containers/registries.d/ghcr.io-marpogaus.yaml << EOF
docker:
  ghcr.io/marpogaus:
    use-sigstore-attachments: true
EOF

# Download and install the public key:
curl -o /usr/etc/pki/containers/marpogaus-cosign.pub https://raw.githubusercontent.com/marpogaus/containerfiles/main/cosign.pub

# Update container policy to allow signed images from this repository
POLICY_FILE="/usr/etc/containers/policy.json"

jq --arg image_registry "ghcr.io/marpogaus" \
   --arg image_registry_key "marpogaus-cosign" \
   '.transports.docker |= 
    { $image_registry: [
        {
            "type": "sigstoreSigned",
            "keyPath": ("/usr/etc/pki/containers/" + $image_registry_key + ".pub"),
            "signedIdentity": {
                "type": "matchRepository"
            }
        }
    ] } + .' "${POLICY_FILE}" > POLICY.tmp

cp POLICY.tmp /usr/etc/containers/policy.json
cp POLICY.tmp /etc/containers/policy.json
rm POLICY.tmp

### Enable systemd-homed
# Build and install SELinux custom policy
TMP_DIR=/tmp/homed-selinux
git clone https://github.com/richiedaze/homed-selinux $TMP_DIR
cd $TMP_DIR

make -f /usr/share/selinux/devel/Makefile homed.pp
semodule --install=homed.pp

# Add public key
mkdir -p /var/lib/systemd/home/
cp /ctx/local.public /var/lib/systemd/home/

# Set file context
restorecon -rv \
    /usr/lib/systemd/systemd-homed \
    /usr/lib/systemd/systemd-homework \
    /usr/lib/systemd/system/systemd-homed.service \
    /usr/lib/systemd/system/systemd-homed-activate.service \
    /var/lib/systemd/home

# Enable the authselect profile feature and the systemd service
authselect enable-feature with-systemd-homed
systemctl enable systemd-homed

### Clean dnf caches
dnf clean all