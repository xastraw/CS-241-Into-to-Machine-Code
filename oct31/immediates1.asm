.data

str: .asciz "The value is %i\n"

.text

.global main
main:
    stp x29, x30, [sp, #-16]!

    ldr x0, =str
    mov w1, #-1 //-1 as a 32 bit int is 0xFFFFFFFF
    bl printf


    ldp x29, x30, [sp], #16
    mov w0, #0
    ret
    