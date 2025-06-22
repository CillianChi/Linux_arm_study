#!/bin/bash
set -e
set -u

OPENSBI_REPO="https://github.com/riscv-software-src/opensbi.git"
OPENSBI_DIR="opensbi"
PLATFORM="generic"
CROSS_COMPILE="riscv64-linux-gnu-"
OUTPUT_FW="build/platform/${PLATFORM}/firmware/fw_payload.elf"

# 工具鏈檢查
if ! command -v ${CROSS_COMPILE}gcc &>/dev/null; then
  echo "❌ 找不到 ${CROSS_COMPILE}gcc，請安裝 riscv64-linux-gnu 工具鏈"
  exit 1
fi

# Clone opensbi（若尚未存在）
if [ ! -d "$OPENSBI_DIR" ]; then
  echo "📥 Cloning OpenSBI..."
  git clone "$OPENSBI_REPO" "$OPENSBI_DIR"
fi

cd "$OPENSBI_DIR"

echo "🧹 清除舊的 build..."
make distclean || true

echo "🚀 開始編譯 OpenSBI（platform=$PLATFORM）..."
make PLATFORM=$PLATFORM CROSS_COMPILE=$CROSS_COMPILE

if [ -f "$OUTPUT_FW" ]; then
  echo "✅ 成功產出：$OUTPUT_FW"
else
  echo "❌ 編譯失敗，fw_payload.elf 沒找到"
  exit 1
fi
# 把編譯成果複製到 output
echo "📂 複製 fw_payload.elf 到 output/ 目錄"
mkdir -p "$WORKSPACE/output"
cp "$OUTPUT_ELF" "$WORKSPACE/output/fw_payload.elf"