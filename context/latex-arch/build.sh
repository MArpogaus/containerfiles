#!/bin/bash
set -ouex pipefail

curl 'https://archlinux.org/mirrorlist/?protocol=https&ip_version=4&use_mirror_status=on?country=US' | sed 's:#Server:Server:' | grep -v '^#' | head -n 25 > /tmp/mirrorlist \
    && rankmirrors -n 5 /tmp/mirrorlist | tee /etc/pacman.d/mirrorlist

echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen \
    && echo LANG=en_US.UTF-8 > /etc/locale.conf \
    && locale-gen

pacman -Syyu --noconfirm \
    && pacman -S --noconfirm \
    biber \
    texlive-basic \
    texlive-bibtexextra \
    texlive-binextra \
    texlive-fontsextra \
    texlive-fontsrecommended \
    texlive-langgerman \
    texlive-latex \
    texlive-latexextra \
    texlive-latexrecommended \
    texlive-luatex \
    texlive-mathscience \
    texlive-pictures \
    texlive-plaingeneric \
    texlive-publishers \
    zathura-pdf-poppler \
    zip && \
    pacman -Scc --noconfirm
