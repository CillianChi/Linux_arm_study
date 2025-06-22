.section .text
.global _start
_start:
    csrs mstatus, 8
    csrc mstatus, 8
    ret
