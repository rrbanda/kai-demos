FROM fedora:39

# Disable zchunk metadata to avoid checksum issues
RUN echo 'zchunk=false' >> /etc/dnf/dnf.conf

# Clean old cache and install dependencies
RUN dnf clean all && \
    dnf install -y \
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

# Optional: Add extension if available
# RUN wget https://github.com/konveyor/editor-extensions/releases/download/v0.1.0/konveyor-v0.1.0.vsix && \
#     code-server --install-extension konveyor-v0.1.0.vsix && \
#     rm konveyor-v0.1.0.vsix

USER 1000
