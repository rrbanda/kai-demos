FROM fedora:39

# Install dependencies (Kai + VS Code CLI support)
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

# Install code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Download and install the Konveyor AI extension
RUN curl -L -o /tmp/konveyor-ai.vsix https://github.com/konveyor/editor-extensions/releases/download/v0.1.0/konveyor-v0.1.0.vsix && \
    code-server --install-extension /tmp/konveyor-ai.vsix && \
    rm /tmp/konveyor-ai.vsix

# Expose default code-server port
EXPOSE 8080

# Ensure proper runtime dir for code-server
ENV XDG_CONFIG_HOME=/projects/.config

# Set code-server as the default process
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none", "/projects"]

USER 1000
