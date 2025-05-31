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

# 1. 檢查 kernel 原始碼與模組資料夾
info "檢查必要資料夾與原始碼..."
[ -d "$LINUX_DIR" ] || err "找不到 linux 原始碼目錄：$LINUX_DIR"
[ -d "$MODULE_DIR" ] || mkdir -p "$MODULE_DIR"

cd "$LINUX_DIR"

# 2. 建立 config（若不存在 .config）
if [ ! -f .config ]; then
  info "準備 defconfig（啟用模組支援）..."
  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
  scripts/config --enable CONFIG_MODULES || true
  scripts/config --enable CONFIG_MODULE_UNLOAD || true
  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- olddefconfig
fi


# 🔧 先編譯 led_common 模組，產生 Module.symvers
info "🛠 先編譯共用模組 led_common..."
make -C "$LINUX_DIR" M="$COMMON_DIR" ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules > /dev/null

# 🔁 告訴其他模組去哪找 symbol
export KBUILD_EXTRA_SYMBOLS="$COMMON_DIR/Module.symvers"

# 🔁 遞迴兩層找出其他 Makefile 模組
info "自動編譯所有子目錄 modules（支援兩層）..."
find "$MODULE_DIR" -type f -name 'Makefile' | while read makefile; do
  mod_path=$(dirname "$makefile")
  if [[ "$mod_path" == "$COMMON_DIR" ]]; then continue; fi  # 跳過 led_common 自己
  mod_name=$(basename "$mod_path")
  info "正在編譯模組: $mod_name"
  make -C "$LINUX_DIR" M="$mod_path" ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules > /dev/null
done

info "✅ 所有模組編譯完成！"