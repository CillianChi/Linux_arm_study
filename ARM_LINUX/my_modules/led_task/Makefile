obj-m += led_common.o

KDIR := /Project/linux
PWD := $(shell pwd)

SUBDIRS := $(wildcard $(PWD)/*_task)

all:
	@echo "[INFO] Building led_common first..."
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules

	@echo "[INFO] Building submodules (LED Tasks)..."
	@for dir in $(SUBDIRS); do \
	  echo "[INFO] Entering $$dir..."; \
	  $(MAKE) -C $(KDIR) M=$$dir \
	    ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
	    KBUILD_EXTRA_SYMBOLS=$(PWD)/Module.symvers; \
	done

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
	@for dir in $(SUBDIRS); do \
	  $(MAKE) -C $(KDIR) M=$$dir clean; \
	done