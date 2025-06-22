#!/bin/bash
set -e  # 有錯誤就中止執行

PROJECT_DIR="/Project"
LINUX_DIR="$PROJECT_DIR/linux"
MODULE_DIR="$PROJECT_DIR/my_modules"
COMMON_DIR="$MODULE_DIR/led_task"
IMAGE_OUT="$PROJECT_DIR/Image"

# 顏色定義
COLOR_INFO="\033[1;34m"
COLOR_ERR="\033[1;31m"
COLOR_RESET="\033[0m"

# 顯示 info 訊息
info() {
  echo -e "${COLOR_INFO}[INFO] $1${COLOR_RESET}"
}

# 顯示錯誤並中止
err() {
  echo -e "${COLOR_ERR}[ERROR] $1${COLOR_RESET}" >&2
  exit 1
}

# 1️⃣ 檢查目錄
info "🔍 檢查必要資料夾與原始碼..."
[ -d "$LINUX_DIR" ] || err "找不到 linux 原始碼目錄：$LINUX_DIR"
[ -d "$MODULE_DIR" ] || mkdir -p "$MODULE_DIR"

cd "$LINUX_DIR"

# 2️⃣ 確保 .config 存在
if [ ! -f .config ]; then
  info "⚙️  準備 defconfig（啟用模組支援）..."
  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
  scripts/config --enable CONFIG_MODULES || true
  scripts/config --enable CONFIG_MODULE_UNLOAD || true
  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- olddefconfig
fi

# 3️⃣ 先編譯 led_common 模組，供其他模組引用符號
info "🛠️  編譯共用模組 led_common..."
make -C "$LINUX_DIR" M="$COMMON_DIR" ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules > /dev/null

# 匯出 symbol 檔案給後續模組
export KBUILD_EXTRA_SYMBOLS="$COMMON_DIR/Module.symvers"

# 4️⃣ 自動尋找 my_modules/ 下第一層含 Makefile 的模組資料夾
info "📦 自動編譯模組（第一層）..."
for dir in "$MODULE_DIR"/*; do
  if [ -d "$dir" ] && [ -f "$dir/Makefile" ]; then
    # 跳過 led_common（剛已手動編譯）
    if [[ "$dir" == "$COMMON_DIR" ]]; then continue; fi

    mod_name=$(basename "$dir")
    info "🔧 編譯模組: $mod_name"
    make -C "$LINUX_DIR" M="$dir" ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules > /dev/null
  fi
done

# 5️⃣ 手動編譯 led_task 底下的子模組
info "🔧 特別編譯 led_task 子模組..."
info "🛠️  編譯共用模組 led_common..."
COMMON_DIR="$MODULE_DIR/led_task"

make -C "$LINUX_DIR" M="$COMMON_DIR" ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules

export KBUILD_EXTRA_SYMBOLS="$COMMON_DIR/Module.symvers"

# 正常印出確認
if [ ! -f "$COMMON_DIR/Module.symvers" ]; then
  err "❌ 共用模組未正確產出 Module.symvers：$COMMON_DIR/Module.symvers"
fi


MODULE_LED="$MODULE_DIR/led_task"
make -C "$LINUX_DIR" M="$MODULE_LED/led1_task" ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules > /dev/null
make -C "$LINUX_DIR" M="$MODULE_LED/led2_task" ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules > /dev/null

info "✅ 所有模組編譯完成！"