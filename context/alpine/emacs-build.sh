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
	direnv \
	emacs \
	enchant2 \
	fd \
	fzf \
	git \
	delta \
	graphviz \
	htop \
	hunspell \
	hunspell-en \
	imagemagick \
	pandoc \
	parallel \
	ripgrep \
	shellcheck \
	shfmt \
	tmux \
	tree \
	unzip \
	vim \
	py3-uv \
	zathura-pdf-poppler \
	zip

# Clean package cache
apk cache clean
