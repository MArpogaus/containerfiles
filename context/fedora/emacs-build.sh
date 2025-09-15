#!/bin/bash
set -ouex pipefail

# Update package database
dnf makecache

# Install packages
dnf install -y \
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
    fzf \
    git \
    graphviz \
    htop \
    hunspell \
    hunspell-en \
    ImageMagick \
    libtool \
    make \
    pandoc \
    parallel \
    uv \
    ripgrep \
    shellcheck \
    shfmt \
    tmux \
    tree \
    unzip \
    vim \
    zathura-pdf-poppler \
    zip

# Clean package cache
dnf clean all
