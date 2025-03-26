
FROM fedora:39

# Install all required dependencies (Kai + build tools + VS Code compatibility)
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
    openssl-devel \
    wget && \
    dnf clean all

# Install code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Install Konveyor VS Code extension
RUN mkdir -p /tmp/extensions && \
    curl -L -o /tmp/extensions/konveyor.vsix https://github.com/konveyor/editor-extensions/releases/download/v0.1.0/konveyor-v0.1.0.vsix && \
    code-server --install-extension /tmp/extensions/konveyor.vsix && \
    rm -rf /tmp/extensions

# Avoid EACCES errors in Dev Spaces or shared root
ENV XDG_CONFIG_HOME=/projects/.config

# Use non-root user (Dev Spaces compatible)
USER 1000
