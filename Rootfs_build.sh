#!/bin/bash
set -e

echo "[INFO] 清除舊資料與編譯結果..."
cd busybox
make clean || true

echo "[INFO] 採用預設設定並啟用安裝..."
make defconfig

# 確保 BusyBox 支援 init 系統與模組加載
sed -i 's/.*CONFIG_STATIC.*/CONFIG_STATIC=y/' .config
sed -i 's/.*CONFIG_FEATURE_INIT.*/CONFIG_FEATURE_INIT=y/' .config
sed -i 's/.*CONFIG_INIT.*/CONFIG_INIT=y/' .config

echo "[INFO] 開始編譯 BusyBox..."
make -j$(nproc)

echo "[INFO] 安裝 BusyBox 到 rootfs..."
make CONFIG_PREFIX=../rootfs install

cd ..

echo "[INFO] 準備 rootfs 基本目錄結構..."
mkdir -p rootfs/{proc,sys,dev,etc,lib,modules}

# 建立基本裝置節點
sudo mknod -m 666 rootfs/dev/null c 1 3 || true
sudo mknod -m 600 rootfs/dev/console c 5 1 || true

# 拷貝自訂模組
echo "自訂模組"
if [ -f my_modules/hello.ko ]; then
    echo "hello.ko"
    cp my_modules/hello.ko rootfs/modules/
    
fi
if [ -f "$PROJECT_DIR/my_modules/hello_sys/hello_sys.ko" ]; then
    echo "✔ 複製 hello_sys.ko 至 rootfs/modules/"
    cp "$PROJECT_DIR/my_modules/hello_sys/hello_sys.ko" "$ROOTFS_DIR/modules/"
fi
# 建立 init 腳本
cat <<EOF > rootfs/init
#!/bin/sh
mount -t proc none /proc
mount -t sysfs none /sys
insmod /modules/hello.ko 2>/dev/null
echo "歡迎進入 BusyBox 環境"
exec /bin/sh
EOF

chmod +x rootfs/init

echo "[INFO] 壓縮為 rootfs.cpio.gz..."
cd rootfs
find . | cpio -o -H newc | gzip > ../rootfs.cpio.gz
cd ..

echo "[SUCCESS] rootfs.cpio.gz 產生完成！"
