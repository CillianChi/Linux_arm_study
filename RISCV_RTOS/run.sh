echo "🚀 Running QEMU..."
qemu-system-riscv32 \
  -machine virt \
  -nographic \
  -bios none \
  -kernel output/RTOSDemo.elf \
  -d unimp

#qemu-system-riscv32 -nographic -machine virt -net none -chardev stdio,id=con,mux=on \
  #  -serial chardev:con -mon chardev=con,mode=readline -bios none -smp 4 \
   # -s --kernel output/RTOSDemo.elf