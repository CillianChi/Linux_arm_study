savedcmd_led2_task.ko := aarch64-linux-gnu-ld -r -EL  -maarch64elf -z noexecstack --build-id=sha1  -T /Project/linux/scripts/module.lds -o led2_task.ko led2_task.o led2_task.mod.o .module-common.o
