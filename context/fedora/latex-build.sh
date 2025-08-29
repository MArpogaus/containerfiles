#!/bin/bash
set -ouex pipefail

# Update package database
dnf makecache

# Install packages
dnf install -y \
	pdf2svg \
	texlive-collection-bibtexextra \
	texlive-collection-fontsextra \
	texlive-listingsutf8 \
	texlive-scheme-medium \
	texlive-usebib \
	zathura-pdf-poppler

# Clean package cache
dnf clean all
