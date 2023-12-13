//to compile:
//as hello.asm -o hello.o
//gcc hello.o -o hello
//./hello
.data

mystring: .asciz "Hello, world!\n"
myint: .word 0x1832
mybigint: .dword 0xDEADBEED


.text


.global main
main:
    stp x29, x30, [sp, #-16]!

    //This is like &mystring
    ldr x0, =mystring
    bl puts


    ldp x29, x30, [sp], #16
    mov w0, #0
    ret
