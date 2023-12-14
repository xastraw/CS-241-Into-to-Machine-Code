//to compile:
//as hello.asm -o hello.o
//gcc hello.o -o hello
//./hello
.data
mystring: .asciz "Xander\n"


.text



.global main
main:
    stp x29, x30, [sp, #-16]!


    ldr x0, =mystring
    bl puts


    ldp x29, x30, [sp], #16
    mov w0, #0
    ret
