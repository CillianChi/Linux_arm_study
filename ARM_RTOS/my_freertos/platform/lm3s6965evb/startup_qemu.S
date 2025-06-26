.syntax unified
.cpu cortex-m3
.thumb

.global Reset_Handler
.global _estack

.section .isr_vector, "a", %progbits
_estack = 0x20005000  /* 20KB SRAM */
.word _estack
.word Reset_Handler
.word NMI_Handler
.word HardFault_Handler
.word MemManage_Handler
.word BusFault_Handler
.word UsageFault_Handler
.word 0
.word 0
.word 0
.word 0
.word SVC_Handler
.word DebugMon_Handler
.word 0
.word PendSV_Handler
.word SysTick_Handler

/* External Interrupts (IRQ0 ~ IRQ47) */
.word Default_Handler  /* IRQ0 */
.word Default_Handler  /* IRQ1 */
.word Default_Handler  /* IRQ2 */
.word Default_Handler  /* IRQ3 */
.word Default_Handler  /* IRQ4 */
.word Default_Handler  /* IRQ5 */
.word EXTI0_IRQHandler  /* IRQ6 */
.word EXTI1_IRQHandler  

/* Dummy entries for IRQs (可依 NVIC 數量擴充) */
.rept 48
    .word Default_Handler
.endr

.section .text.Reset_Handler
.type Reset_Handler, %function
Reset_Handler:
    /* Copy .data section */
    ldr r0, =_sdata
    ldr r1, =_etext
    ldr r2, =_edata
1:
    cmp r0, r2
    bcs 2f
    ldr r3, [r1], #4
    str r3, [r0], #4
    b 1b
2:
    /* Zero .bss section */
    ldr r0, =_sbss
    ldr r1, =_ebss
    movs r2, #0
3:
    cmp r0, r1
    bcs 4f
    str r2, [r0], #4
    b 3b
4:
    bl main
5:  b 5b
.size Reset_Handler, . - Reset_Handler