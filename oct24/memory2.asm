.data



.text


.global main
main:
    stp x29, x30, [sp, #-16]!

    mov x0, #1832
    mov x1, #1776

    sub sp, sp, #16
    stp, x0, x1, [sp]
    add sp, sp, #16


    ldp x29, x30, [sp], #16
    mov w0, #0
    ret
