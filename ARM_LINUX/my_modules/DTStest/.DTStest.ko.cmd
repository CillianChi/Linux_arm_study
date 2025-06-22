savedcmd_DTStest.ko := aarch64-linux-gnu-ld -r -EL  -maarch64elf -z noexecstack --build-id=sha1  -T /Project/linux/scripts/module.lds -o DTStest.ko DTStest.o DTStest.mod.o .module-common.o
