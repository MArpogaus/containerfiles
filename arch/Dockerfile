FROM greyltc/archlinux-aur:yay

run curl 'https://archlinux.org/mirrorlist/?country=DE&protocol=https&ip_version=4' | sed 's:#Server:Server:' > /tmp/mirrorlist \
    && rankmirrors -n 5 /tmp/mirrorlist > /etc/pacman.d/mirrorlist

run echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen \
    && echo LANG=en_US.UTF-8 > /etc/locale.conf \
    && locale-gen

RUN pacman -Syyu --noconfirm \
    && pacman -S --noconfirm \
    bat \
    biber \
    cmake \
    emacs-nativecomp \
    fd \
    fzf \
    git \
    git-delta \
    gpa \
    graphviz \
    htop \
    hunspell \
    hunspell-de \
    hunspell-en_us \
    imagemagick \
    jre-openjdk \
    libnotify \
    libpulse \
    openssh \
    pandoc \
    pdf2svg \
    perl-clone \
    perl-file-homedir \
    perl-yaml-tiny \
    python3 \
    ripgrep \
    shellcheck \
    shfmt \
    stow \
    tmux \
    tree \
    vim \
    watchexec \
    zathura-pdf-poppler

RUN aur-install tllocalmgr-git
