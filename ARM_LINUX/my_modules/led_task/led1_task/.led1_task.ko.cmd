savedcmd_led1_task.ko := aarch64-linux-gnu-ld -r -EL  -maarch64elf -z noexecstack --build-id=sha1  -T /Project/linux/scripts/module.lds -o led1_task.ko led1_task.o led1_task.mod.o .module-common.o
