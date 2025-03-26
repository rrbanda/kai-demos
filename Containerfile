FROM fedora:39

# Install required dependencies
RUN dnf install -y \
    wget \
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

# Install code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Install the Konveyor AI VS Code extension
RUN wget https://github.com/konveyor/editor-extensions/releases/download/v0.1.0/konveyor-v0.1.0.vsix && \
    code-server --install-extension konveyor-v0.1.0.vsix && \
    rm konveyor-v0.1.0.vsix

# Switch to a non-root user (Dev Spaces compatible)
USER 1000
