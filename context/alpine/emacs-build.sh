#!/bin/bash
set -ouex pipefail

# Update package database
apk update

# Install packages
apk add --no-cache \
    bash \
    bat \
    cmake \
    ctags \
    delta \
    direnv \
    emacs-pgtk-nativecomp \
    enchant2 \
    enchant2-dev \
    fd \
    fzf \
    git \
    graphviz \
    htop \
    hunspell \
    hunspell-en \
    imagemagick \
    libtool \
    make \
    pandoc \
    parallel \
    py3-uv \
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
apk cache clean
