# Linux Kernel 計劃
此專案目的用於自我學習，以下是我的學習規劃。   
短期目標熟悉玩Linux Kernel運作   
長期目標是優化架構+自訂tool chain (mac)

使用Tool : Linux sorce code / Git / Docker / Homebrew / Qemu / Busybox   
1.在Mac Os(M系)建立Arm64 + Linux Kernel 環境--Done--    
2.自定義自動化 kernel module 測試（Shell Script + Dockerfile+ Make）--Done--    
3.自定義DTS並對應 Platform Driver，完成從 driver binding 的驗證。--on-going--     
4.優化 kernel scheduling 與 driver lifecycle 調用資源 。













# Mac系統編譯 Linux Kernerl
## 安裝 Homebrew 
+ 連結：https://brew.sh/
+ 功能：Homebrew 是 macOS 上的「套件管理工具」，就像 Linux 裡的 apt、yum。它幫你安裝 Unix 工具、編譯器、模擬器… 讓 macOS 具備像 Linux 的開發環境。

### <p>安裝</p>
<pre><code>/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
</code></pre>
### <p>將Homebrew加入MacOS環境</p>
<pre><code>echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
</code></pre>
### <p>確認</p>
<pre><code>brew --version
</code></pre>
### <p>移除Homebrew</p>
<pre><code>/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
</code></pre>


## 建立環境Linux kernel 編譯環境
### <p>安裝常用套件</p>
<pre><code>brew install git make wget ncurses qemu
</code></pre>

+ git：版本控制工具，用於 clone Linux kernel 原始碼等。
+ make：編譯工具，用來執行 Makefile 指定的 kernel build 流程。
+ wget：下載工具，可用來抓 kernel 或其他工具鏈。
+ ncurses：終端 UI 函式庫，kernel config 選單（如 make menuconfig）會使用它。
+ qemu：模擬器，用於在 macOS 上模擬 ARM64 的硬體平台，方便測試 kernel。
### <p>安裝TooLChains</p>
三方 Homebrew Tap（軟體來源），由 messense 維護，專門提供交叉編譯工具鏈，例如 aarch64-unknown-linux-gnu-gcc。
<pre><code>  brew tap messense/macos-cross-toolchains
</code></pre>
### <p>交叉編譯工具鏈</p> 
這會安裝 交叉編譯工具鏈，主要包含：
+ aarch64-unknown-linux-gnu-gcc：針對 ARM64 架構 的 GCC 編譯器。
+ aarch64-unknown-linux-gnu-ld、objdump、strip、as 等其他工具：針對 Linux 上 ARM64 架構的執行檔進行處理。
  

### <p>安裝GUN</p>

<pre><code>  brew install aarch64-unknown-linux-gnu
</code></pre>

### <p>確認GUN</p>
<pre><code>  aarch64-unknown-linux-gnu-gcc --version
</code></pre>

