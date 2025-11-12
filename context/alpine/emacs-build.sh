#!/bin/bash
set -ouex pipefail

# Update package database
apk update

# Install packages
apk add --no-cache \
    7zip \
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
    ffmpegthumbnailer \
    fzf \
    git \
    graphviz \
    htop \
    hunspell \
    hunspell-de-de \
    hunspell-en \
    imagemagick \
    libtool \
    make \
    mediainfo \
    pandoc \
    parallel \
    poppler-utils \
    py3-uv \
    ripgrep \
    shellcheck \
    shfmt \
    tmux \
    tree \
    unzip \
    vim \
    vips-tools \
    zathura-pdf-poppler \
    zip

# Clean package cache
apk cache clean
