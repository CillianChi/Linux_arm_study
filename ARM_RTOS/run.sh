echo "🚀 Running QEMU..."
qemu-system-arm -M lm3s6965evb -nographic -kernel output/RTOSDemo.elf
#qemu-system-riscv32 -nographic -machine virt -net none -chardev stdio,id=con,mux=on \
  #  -serial chardev:con -mon chardev=con,mode=readline -bios none -smp 4 \
   # -s --kernel output/RTOSDemo.elf