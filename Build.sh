#!/bin/bash

set -e

PROJECT_DIR="/Project"
LINUX_DIR="$PROJECT_DIR/linux"
MODULE_DIR="$PROJECT_DIR/my_modules"
IMAGE_OUT="$PROJECT_DIR/Image"

COLOR_INFO="\033[1;34m"
COLOR_ERR="\033[1;31m"
COLOR_RESET="\033[0m"

info() {
  echo -e "${COLOR_INFO}[INFO] $1${COLOR_RESET}"
}

err() {
  echo -e "${COLOR_ERR}[ERROR] $1${COLOR_RESET}" >&2
  exit 1
}

# Check required directories
info "檢查必要資料夾與原始碼..."
[ -d "$LINUX_DIR" ] || err "找不到 linux 原始碼目錄：$LINUX_DIR"
[ -d "$MODULE_DIR" ] || mkdir -p "$MODULE_DIR"

cd "$LINUX_DIR"

# Build kernel with module support
test -f .config || {
  info "準備 defconfig (啟用模組支援)..."
  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
  scripts/config --enable CONFIG_MODULES || true
  scripts/config --enable CONFIG_MODULE_UNLOAD || true
  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- olddefconfig
}

info "開始編譯 Kernel..."
#make -j$(nproc) ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image modules
make -j$(nproc --all) -l 0 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image modules
cp arch/arm64/boot/Image "$IMAGE_OUT"

# Build custom modules
if [ -d "$MODULE_DIR" ]; then
  info "編譯自訂 modules..."
  #make -C "$LINUX_DIR" M="$MODULE_DIR/hellow" ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules
  #make -C "$LINUX_DIR" M="$MODULE_DIR/hellow_sys" ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules
  make -C "$LINUX_DIR" M="$MODULE_DIR/hello" ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules > /dev/null
  make -C "$LINUX_DIR" M="$MODULE_DIR/hello_sys" ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules > /dev/nullfi



fi

info "Kernel 與 Modules 編譯完成 ✅"
