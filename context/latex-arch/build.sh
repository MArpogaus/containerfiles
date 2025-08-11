#!/bin/bash
set -ouex pipefail

curl -s 'https://archlinux.org/mirrorlist/?protocol=https&ip_version=4&use_mirror_status=on?country=US' | grep Server | sed 's:#Server:Server:' | tee /etc/pacman.d/mirrorlist

pacman -Syyu --noconfirm
pacman -S --noconfirm \
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
	zip
pacman -Scc --noconfirm
