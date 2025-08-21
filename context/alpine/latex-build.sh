#!/bin/bash
set -ouex pipefail

# Update package database
apk update

# Install LaTeX and related packages
apk add --no-cache \
	texlive-most \
	pdf2svg \
	zathura \
	zathura-pdf-poppler

# Clean package cache
apk cache clean
