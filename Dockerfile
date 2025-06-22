# === Dockerfile ===
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# ===== 安裝共通開發工具與依賴 =====
RUN apt update && apt install -y \
    build-essential gcc make bc bison flex libssl-dev \
    libelf-dev cpio libncurses-dev git wget file python3 rsync zstd sudo vim \
    curl autoconf automake autotools-dev \
    libmpc-dev libmpfr-dev libgmp-dev gawk \
    texinfo libtool libtool-bin libusb-1.0-0-dev \
    libexpat-dev device-tree-compiler libisl-dev ninja-build \
    cmake pkg-config zlib1g-dev libglib2.0-dev \
    gcc-aarch64-linux-gnu \
    && rm -rf /var/lib/apt/lists/*

# ===== 設定環境變數 PATH =====
ENV PATH=/opt/riscv64/bin:/opt/riscv32/bin:$PATH

# ===== Clone riscv-gnu-toolchain 固定版本 (2025.01.20) =====
WORKDIR /opt
RUN git clone https://github.com/riscv-collab/riscv-gnu-toolchain \
    && cd riscv-gnu-toolchain \
    && git checkout a33dac0251d17a7b74d99bd8fd401bfce87d2aed \
    && git submodule update --init --recursive

# ===== Build riscv64 toolchain =====
WORKDIR /opt/riscv-gnu-toolchain
RUN mkdir build64 && cd build64 \
    && ../configure --prefix=/opt/riscv64 --with-arch=rv64imac --with-abi=lp64 \
    && make -j$(nproc) newlib

# ===== Build riscv32 toolchain =====
WORKDIR /opt/riscv-gnu-toolchain
RUN mkdir build32 && cd build32 \
    && ../configure --prefix=/opt/riscv32 --with-arch=rv32imac --with-abi=ilp32 \
    && make -j$(nproc) newlib

# ===== 安裝 QEMU v8.2.2，支援 RISC-V + ARM =====
WORKDIR /opt
RUN git clone https://github.com/qemu/qemu.git \
    && cd qemu && git checkout v8.2.2 \
    && ./configure --target-list=riscv64-softmmu,riscv32-softmmu,arm-softmmu,aarch64-softmmu \
    && make -j$(nproc) \
    && make install

# ===== 預設工作資料夾 =====
WORKDIR /workspace

# ===== 預設啟動 bash =====
CMD ["/bin/bash"]