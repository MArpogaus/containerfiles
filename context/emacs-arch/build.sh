#!/bin/bash
set -ouex pipefail

curl -s 'https://archlinux.org/mirrorlist/?protocol=https&ip_version=4&use_mirror_status=on?country=US' | grep Server | sed 's:#Server:Server:' | tee /etc/pacman.d/mirrorlist

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
	zathura-pdf-poppler \
	zip
pacman -Scc --noconfirm
