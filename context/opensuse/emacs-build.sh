#!/bin/bash
set -ouex pipefail

# Refresh repositories
zypper refresh

# Update all packages
zypper -n dist-upgrade

# Install packages
zypper -n install \
	bash \
	bash-language-server \
	bat \
	cmake \
	ctags \
	direnv \
	emacs \
	enchant-2 \
	fd \
	fzf \
	git \
	git-delta \
	graphviz \
	htop \
	hunspell \
	hunspell-en_US \
	ImageMagick \
	pandoc \
	parallel \
	pdf2svg \
	ripgrep \
	ShellCheck \
	shfmt \
	tmux \
	tree \
	unzip \
	vim \
	python311-uv \
	zathura-plugin-pdf-poppler \
	zip

# Clean package cache
zypper clean --all
