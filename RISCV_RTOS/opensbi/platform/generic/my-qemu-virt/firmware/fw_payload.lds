OUTPUT_ARCH(riscv)
ENTRY(_start)

SECTIONS
{
  FW_PAYLOAD_TEXT_START = 0x80000000;

  . = FW_PAYLOAD_TEXT_START;
  .text : { *(.text*) }
  .rodata : { *(.rodata*) }
  .data : { *(.data*) }
  .bss : { *(.bss*) }
}