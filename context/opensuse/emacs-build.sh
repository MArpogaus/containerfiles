#!/bin/bash
set -ouex pipefail

# Refresh repositories
zypper refresh

# Update all packages
zypper -n dist-upgrade

# Install packages
zypper -n install \
	ImageMagick \
	ShellCheck \
	bash \
	bat \
	cmake \
	ctags \
	direnv \
	emacs \
	enchant \
	fd \
	fzf \
	git \
	git-delta \
	gnu_parallel \
	graphviz \
	htop \
	hunspell \
	pandoc \
	pdf2svg \
	python311-uv \
	ripgrep \
	shfmt \
	tmux \
	tree \
	unzip \
	vim \
	zathura-plugin-pdf-poppler \
	zip

# Clean package cache
zypper clean --all
