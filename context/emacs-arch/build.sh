#!/bin/bash
set -ouex pipefail

curl 'https://archlinux.org/mirrorlist/?protocol=https&ip_version=4&use_mirror_status=on?country=US' | sed 's:#Server:Server:' | grep -v '^#' | head -n 25 > /tmp/mirrorlist \
    && rankmirrors -n 5 /tmp/mirrorlist | tee /etc/pacman.d/mirrorlist

echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen \
    && echo LANG=en_US.UTF-8 > /etc/locale.conf \
    && locale-gen

pacman -Syyu --noconfirm \
    && pacman -S --noconfirm \
    bash-language-server \
    bat \
    cmake \
    ctags \
    direnv \
    emacs-wayland \
    enchant \
    fd \
    fzf \
    git \
    git-delta \
    graphviz \
    htop \
    hunspell \
    hunspell-de \
    hunspell-en_us \
    imagemagick \
    pandoc \
    parallel \
    pdf2svg \
    ripgrep \
    shellcheck \
    shfmt \
    tmux \
    tree \
    unzip \
    vim \
    zathura-pdf-poppler \
    zip && \
    pacman -Scc --noconfirm
