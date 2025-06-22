#!/bin/bash

# 設定變數
ARCH=arm64
CROSS=aarch64-linux-gnu-
KERNEL_SRC=./linux
DTS_PATH=arch/arm64/boot/dts/my_dts
DTS_FILE=mydts.dts
DTB_FILE=mydts.dtb

echo "🔧 [1/2] 編譯 Device Tree Source (.dts ➜ .dtb)"
make -C $KERNEL_SRC ARCH=$ARCH CROSS_COMPILE=$CROSS dtbs

echo "🔍 [2/2] 檢查是否產出目標 dtb"
DTB_FULL_PATH=$KERNEL_SRC/$DTS_PATH/$DTB_FILE

if [ -f "$DTB_FULL_PATH" ]; then
    echo "✅ 編譯成功：$DTB_FULL_PATH"
else
    echo "❌ 編譯失敗：未找到 $DTB_FULL_PATH"
    echo "請檢查："
    echo "  ➤ DTS 是否放在正確路徑：$KERNEL_SRC/$DTS_PATH/$DTS_FILE"
    echo "  ➤ arch/arm64/boot/dts/Makefile 是否有加入："
    echo "      dtb-$(CONFIG_ARCH_XYZ) += $DTB_FILE"
fi