.data

mystring: .asciz "This is a string!"

.text


.global main
main:
    stp x29, x30, [sp, #-16]!
    str x20, [sp, #-16]!

    mrs x20, NZCV

    ldr x0, =mystring
    bl puts

    movz x20, 0x8000, lsl 16
    msr NZCV, x20

    nop
    nop

    ldr x20, [sp], #16
    ldp x29, x30, [sp], #16
    mov w0, #0
    ret
