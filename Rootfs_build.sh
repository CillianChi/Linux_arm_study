#!/bin/bash
set -e

# === 路徑定義 ===
PROJECT_DIR="/Project"
ROOTFS_DIR="$PROJECT_DIR/rootfs"
BUSYBOX_DIR="$PROJECT_DIR/busybox"
MODULES_DIR="$PROJECT_DIR/my_modules"

echo "[INFO] 清除舊資料與編譯結果..."
cd "$BUSYBOX_DIR"
make clean || true

echo "[INFO] 採用預設設定並啟用安裝..."
make defconfig

# ✅ 確保 BusyBox 支援 init 系統與模組加載
sed -i 's/.*CONFIG_STATIC.*/CONFIG_STATIC=y/' .config
sed -i 's/.*CONFIG_FEATURE_INIT.*/CONFIG_FEATURE_INIT=y/' .config
sed -i 's/.*CONFIG_INIT.*/CONFIG_INIT=y/' .config

echo "[INFO] 開始編譯 BusyBox..."
make -j$(nproc)

echo "[INFO] 安裝 BusyBox 到 rootfs..."
make CONFIG_PREFIX="$ROOTFS_DIR" install

cd "$PROJECT_DIR"

echo "[INFO] 準備 rootfs 基本目錄結構..."
mkdir -p "$ROOTFS_DIR"/{proc,sys,dev,etc,lib,modules}

# ✅ 建立基本裝置節點
sudo mknod -m 666 "$ROOTFS_DIR/dev/null" c 1 3 || true
sudo mknod -m 600 "$ROOTFS_DIR/dev/console" c 5 1 || true

# === 拷貝所有 .ko 模組到 rootfs/modules ===
echo "[INFO] 搜尋所有自訂模組..."
find "$MODULES_DIR" -name "*.ko" | while read -r mod; do
    echo ">> Found module: $mod"     # ← 加這行
    modname=$(basename "$mod")
    echo "✔ 複製 $modname 至 $ROOTFS_DIR/modules/"
    cp "$mod" "$ROOTFS_DIR/modules/"
done

# === 建立 init 腳本 ===
echo "[INFO] 建立 init 腳本..."
cat <<EOF > "$ROOTFS_DIR/init"
#!/bin/sh
mount -t proc none /proc
mount -t sysfs none /sys
insmod /modules/hello.ko 2>/dev/null
echo "歡迎進入 BusyBox 環境"
exec /bin/sh
EOF

chmod +x "$ROOTFS_DIR/init"

# === 壓縮為 rootfs.cpio.gz ===
echo "[INFO] 壓縮為 rootfs.cpio.gz..."
cd "$ROOTFS_DIR"
find . | cpio -o -H newc | gzip > "$PROJECT_DIR/rootfs.cpio.gz"
cd "$PROJECT_DIR"

echo "[SUCCESS] rootfs.cpio.gz 產生完成！"