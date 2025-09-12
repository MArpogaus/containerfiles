#!/bin/bash
set -ouex pipefail

cp /ctx/update-mirrors /usr/bin/
update-mirrors US

pacman -Syyu --noconfirm
pacman -S --noconfirm \
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
    python-uv \
    zathura-pdf-poppler \
    zip
pacman -Scc --noconfirm
