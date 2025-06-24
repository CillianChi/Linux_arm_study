#!/bin/bash
set -e
set -u

# 選用 ARM Cortex-M3 toolchain
export CROSS_COMPILE=arm-none-eabi-
export CC=${CROSS_COMPILE}gcc

echo "🛠 使用交叉編譯器：$CC"

echo "🧹 Cleaning output directory..."
rm -rf ./output
make clean
echo "📦 Building project..."
make -j$(nproc)

echo "✅ Build finished successfully."

ELF=output/RTOSDemo.elf
if [ -f "$ELF" ]; then
    echo "📏 ELF Size Info:"
    ${CROSS_COMPILE}size $ELF
else
    echo "❌ ELF not found. Build 可能失敗。"
    exit 1
fi