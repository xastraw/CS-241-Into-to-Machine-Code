.data

    fmtstring: .asciz "The number is %i\n"
    myint: .word 0x1832

.text

.global main
main:
    stp x29, x30, [sp, #-16]!

    ldr x0, =fmtstring
    mov w1, #1832
    bl printf



    ldp x29, x30, [sp], #16
    mov w0, #0
    ret
