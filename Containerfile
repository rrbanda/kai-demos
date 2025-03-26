FROM registry.access.redhat.com/ubi9/ubi:latest

USER 0

# Fix conflict by allowing erasing of curl-minimal
RUN dnf -y install \
    python3.12 \
    python3.12-devel \
    glibc-langpack-en \
    java-17-openjdk-devel \
    nodejs \
    maven \
    zsh \
    git \
    unzip \
    curl \
    --allowerasing && \
    dnf clean all

# Set default shell
ENV SHELL=/bin/zsh

# Create user-friendly workspace path
WORKDIR /projects

USER 1001
