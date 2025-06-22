#!/bin/bash

set -e
set -u
# 專案若編 FreeRTOS 選用 ELF toolchain
export CROSS_COMPILE=riscv32-unknown-elf-
export CC=${CROSS_COMPILE}gcc
echo "🛠 使用 $CC 交叉編譯器"
echo "🧹 Cleaning output directory..."
rm -rf ./output

echo "📦 Building project..."
make DEMO=1 -j$(nproc) 

echo "✅ Build finished successfully."

ELF=output/RTOSDemo.elf
if [ -f "$ELF" ]; then
    echo "📏 ELF Size Info:"
    riscv32-unknown-elf-size $ELF
else
    echo "❌ ELF not found. Build may have失敗。"
    exit 1
fi