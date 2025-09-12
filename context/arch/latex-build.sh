#!/bin/bash
set -ouex pipefail

cp /ctx/update-mirrors /usr/bin/
update-mirrors US

pacman -Syyu --noconfirm
pacman -S --noconfirm \
    biber \
    perl-file-homedir \
    perl-yaml-tiny \
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
    zip
pacman -Scc --noconfirm
