.data

hellostr: .asciz "Hello, world"

.text

.global main
main:
    stp x29, x30, [sp, #-16]!
    stp x19, x20, [sp, #-16]!
//counter initialization
    mov w19, #0
    mov w20, #1
loopcheck:
    cmp w19, #5
    b.ge finish
//loop body
    ldr x0, =hellostr
    bl puts
    add w19, w19, w20
    b loopcheck


finish:
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16
    mov w0, #0
    ret
