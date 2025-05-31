obj-m += led2_task.o

KDIR := /Project/linux
PWD := $(shell pwd)

# KBUILD_EXTRA_SYMBOLS 是由上一層 Makefile 傳入的
all:
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean