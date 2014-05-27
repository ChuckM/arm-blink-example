/* Startup code for ARM */

    .section    .isr_vector

irq_vector_table:
    .global irq_vector_table
    .word   0x2001bffc
                                // Num  Description
                                // ---  ------------------------------
    .word   Reset_Handler       //  1 : Reset
    .word   nmi_handler         //  2 : NMI interrupt
    .word   hardfault_handler   //  3 : hard fault (bad news)
    .word   mmu_handler         //  4 : Memory Manager interrupt
    .word   busfault_handler    //  5 : bus fault (also bad news)
    .word   usagefault_handler  //  6 : usage fail
    .word   0                   //  7 : reserved
    .word   0                   //  8 : reserved
    .word   _default_handler    //  9 : reserved
    .word   0                   // 10 : reserved
    .word   svcall_handler      // 11 : SVC instruction handler
    .word   debug_handler       // 12 : Debugger interrupt
    .word   0                   // 13 : reserved
    .word   pendsv_handler      // 14 ; Pending SV 
    .word   systick_handler     // 15 ; System clock tick
    .word   0                   // 16 ; External interrupt 0


    
    .text
_default_handler:
    .global _default_handler
    b   _default_handler        // hang
/*    bx  lr                      // return to caller */

    .weak nmi_handler
    .thumb_set nmi_handler, _default_handler

    .weak hardfault_handler
    .thumb_set hardfault_handler, _default_handler

    .weak mmu_handler
    .thumb_set mmu_handler, _default_handler

    .weak busfault_handler
    .thumb_set busfault_handler, _default_handler

    .weak usagefault_handler
    .thumb_set usagefault_handler, _default_handler

    .weak svcall_handler
    .thumb_set svcall_handler, _default_handler

    .weak debug_handler
    .thumb_set debug_handler, _default_handler

    .weak pendsv_handler
    .thumb_set pendsv_handler, _default_handler

    .weak systick_handler
    .thumb_set  systick_handler, _default_handler

    .end
