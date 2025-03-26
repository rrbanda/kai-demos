FROM fedora:39

RUN dnf install -y \
    python3.12 \
    python3.12-devel \
    java-17-openjdk-devel \
    nodejs \
    maven \
    unzip \
    git \
    curl \
    zsh \
    gcc \
    make \
    glibc-devel \
    libffi-devel \
    openssl-devel && \
    dnf clean all

USER 1000
