.data

hellostr: .asciz "Hello, world!"


.text

.global main
main:
    stp x29, x30, [sp, #-16]!

    loop:
    ldr x0, =hellostr
    bl puts
    b loop


    ldp x29, x30, [sp], #16
    mov w0, #0
    ret
    