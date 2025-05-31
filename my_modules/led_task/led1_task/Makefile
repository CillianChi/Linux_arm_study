obj-m := led1_task.o

KDIR := ../../../linux
PWD := $(shell pwd)

EXTRA_SYMBOLS := ../led_common/Module.symvers

all:
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean