# 告訴 kernel 編譯器去哪找符號表（重要：順序要對）
KBUILD_EXTRA_SYMBOLS := /Project/my_modules/led_task/Module.symvers

# 編譯目標
obj-m := led1_task.o

# Kernel source path
KDIR := /Project/linux

# 目前資料夾
PWD := $(shell pwd)

all:
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules