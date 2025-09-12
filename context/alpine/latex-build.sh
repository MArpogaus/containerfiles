#!/bin/bash
set -ouex pipefail

# add testing repo
sudo tee -a /etc/apk/repositories <<<"@testing https://dl-cdn.alpinelinux.org/alpine/edge/testing"

# Update package database
apk update

# Install LaTeX and related packages
apk add --no-cache \
    texlive-most \
    texmf-dist-fontsextra \
    pdf2svg@testing \
    zathura-pdf-poppler

# Clean package cache
apk cache clean
