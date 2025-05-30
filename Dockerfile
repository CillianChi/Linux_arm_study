# === Dockerfile ===
# Base image
FROM ubuntu:22.04

# Set environment variables to noninteractive to avoid tzdata prompt
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages (including cross-compiler)
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc-aarch64-linux-gnu \
    make \
    bc \
    bison \
    flex \
    libssl-dev \
    libelf-dev \
    cpio \
    libncurses-dev \
    git \
    wget \
    file \
    python3 \
    rsync \
    zstd \
    sudo \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Set default working directory
WORKDIR /Project

CMD ["/bin/bash"]
