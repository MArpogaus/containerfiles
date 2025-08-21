#!/bin/bash
set -ouex pipefail

# Update package database
apk update

# Install packages
apk add --no-cache \
	bash \
	bash-language-server \
	bat \
	cmake \
	ctags \
	direnv \
	emacs \
	enchant2 \
	fd \
	fzf \
	git \
	git-delta \
	graphviz \
	htop \
	hunspell \
	hunspell-en \
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
	py3-uv \
	zathura-pdf-poppler \
	zip

# Clean package cache
apk cache clean
