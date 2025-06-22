#!/bin/bash
set -euo pipefail

# 參數設定
WORKSPACE="$(pwd)"
OPENSBI_DIR="opensbi"
PLATFORM_NAME="my_virt_test"
PAYLOAD_PATH="$WORKSPACE/output/RTOSDemo.elf"
CROSS_COMPILE="riscv64-linux-gnu-"

OUTPUT_ELF="build/platform/$PLATFORM_NAME/firmware/fw_payload.elf"
OUTPUT_MAP="build/platform/$PLATFORM_NAME/firmware/fw_payload.map"
TARGET_DIR="$WORKSPACE/output/OpenSBI"

# 檢查 Payload 是否存在
echo "🚧 檢查 Payload 是否存在：$PAYLOAD_PATH"
if [ ! -f "$PAYLOAD_PATH" ]; then
  echo "❌ 找不到 Payload：$PAYLOAD_PATH"
  exit 1
fi

# 切換到 opensbi 並清除舊編譯
cd "$OPENSBI_DIR"
echo "🧹 清除舊的編譯結果..."
make distclean || true

# 執行編譯
echo "🚀 編譯 OpenSBI（平台：$PLATFORM_NAME）..."
make PLATFORM="$PLATFORM_NAME" \
     CROSS_COMPILE="$CROSS_COMPILE" \
     FW_PAYLOAD_PATH="$PAYLOAD_PATH" \
     -j"$(nproc)"

# 確認成果
if [ -f "$OUTPUT_ELF" ]; then
  echo "✅ 編譯成功！位於：$OUTPUT_ELF"
else
  echo "❌ 編譯失敗，找不到 $OUTPUT_ELF"
  exit 1
fi

# 輸出結果
echo "📂 確認輸出資料夾存在：$TARGET_DIR"
mkdir -p "$TARGET_DIR"
echo "📂 複製 fw_payload.elf 到 $TARGET_DIR"
cp "$OUTPUT_ELF" "$TARGET_DIR/fw_payload.elf"

# 若 map 檔存在也複製
if [ -f "$OUTPUT_MAP" ]; then
  echo "📂 複製 fw_payload.map 到 $TARGET_DIR"
  cp "$OUTPUT_MAP" "$TARGET_DIR/"
else
  echo "⚠️ 找不到 $OUTPUT_MAP，略過 map 複製"
fi

echo "🎉 完成！"