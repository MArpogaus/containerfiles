#!/bin/bash
set -ouex pipefail

# Update package database
dnf makecache

# Install packages
dnf install -y \
	pdf2svg \
	texlive-scheme-medium \
	texlive-collection-bibtexextra \
	texlive-collection-fontsextra \
        texlive-collection-latexextra \
        texlive-collection-pictures \
	zathura-pdf-poppler

# Clean package cache
dnf clean all
