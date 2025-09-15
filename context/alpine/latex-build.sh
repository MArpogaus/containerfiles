#!/bin/bash
set -ouex pipefail

# add testing repo
sudo tee -a /etc/apk/repositories <<<"@testing https://dl-cdn.alpinelinux.org/alpine/edge/testing"

# Update package database
apk update

# Install LaTeX and related packages
apk add --no-cache \
    pdf2svg@testing \
    texlive-binextra \
    texlive-most \
    texmf-dist-fontsextra \
    zathura-pdf-poppler

# Clean package cache
apk cache clean
