ENTRY(_start)

MEMORY
{
    ROM (rx) : ORIGIN = 0x00000000, LENGTH = 512K
    RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 64K
}

SECTIONS
{
    .text : {
        *(.text*)
        *(.rodata*)
    } > ROM

    .bss : {
        *(.bss*)
        *(COMMON)
    } > RAM

    .data : {
        *(.data*)
    } > RAM
}