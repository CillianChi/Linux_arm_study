# File: my_modules/Makefile

obj-m := hello.o

KDIR := ../Linux
PWD := $(shell pwd)

all:
	make -C $(KDIR) M=$(PWD) ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules
	