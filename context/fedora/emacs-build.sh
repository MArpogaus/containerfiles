#!/bin/bash
set -ouex pipefail

# Update package database
dnf makecache

# Install packages
dnf install -y \
    ImageMagick \
    bat \
    cmake \
    ctags \
    delta \
    direnv \
    emacs-pgtk \
    enchant2 \
    enchant2-devel \
    envsubst \
    fd \
    ffmpegthumbnailer \
    fzf \
    git \
    graphviz \
    htop \
    hunspell \
    hunspell-en \
    libpng \
    libtool \
    make \
    mediainfo \
    pandoc \
    parallel \
    poppler-utils \
    ripgrep \
    shellcheck \
    shfmt \
    tmux \
    tree \
    unzip \
    uv \
    vim \
    vips-tools \
    zathura-pdf-poppler \
    zip

# Clean package cache
dnf clean all
