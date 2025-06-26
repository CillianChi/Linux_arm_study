.syntax unified
.cpu cortex-m3
.thumb

.global Reset_Handler
.global g_pfnVectors

.section .isr_vector, "a", %progbits
g_pfnVectors:
    .word __stack_top
    .word Reset_Handler
    .word Default_Handler /* NMI */
    .word Default_Handler /* HardFault */
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word Default_Handler /* SVC */
    .word 0
    .word 0
    .word Default_Handler /* PendSV */
    .word Default_Handler /* SysTick */

.section .text.Reset_Handler
.type Reset_Handler, %function
Reset_Handler:
    ldr r0, =__data_start__
    ldr r1, =_etext
    ldr r2, =__data_end__
1:
    cmp r0, r2
    ittt lt
    ldrlt r3, [r1], #4
    strlt r3, [r0], #4
    blt 1b

    ldr r0, =__bss_start__
    ldr r1, =__bss_end__
    movs r2, #0
2:
    cmp r0, r1
    it lt
    strlt r2, [r0], #4
    blt 2b

    bl main
    b .

Default_Handler:
    b .