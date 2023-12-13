.data

mystring: .asciz "The pointer is %p.\n"
myval: .word 0xFFFFFFFF
myptr: .dword 0x0

prmpt: .asciz "Type a string, bro. \n"
instr: .asciz "%[^\n]31s"
//[^\n] means it exxcepts any character except a character return
//means it doesnt count the spaces

printstring: .asciz "The string is %s.\n"
.text

.global main
main:
    stp x29, x30, [sp, #-16]!

    //ldr x0, =myval
    //ldr w0, [x0]
    mov w0, #32  //ask for 32 bytes of memory
    bl malloc

    //str x0, [sp, #-16]! //store pointer for later
    ldr x1, =myptr
    str x0, [x1]//loads the address where you want to put the pointer and then putting it there

    mov x1, x0
    ldr x0, =mystring
    bl printf

    //from class
    ldr x0, =prmpt
    bl puts

    ldr x0, =instr
    ldr x2, =myptr
    ldr x1, [x2]
    bl scanf
    //data will go to pointer that malloc gave us, which is in myptr

    ldr x0, =printstring
    ldr x1, =myptr
    ldr x1, [x1]
    bl printf

    ldr x1, =myptr
    ldr x0, [x1]
    bl free  // free allocated memory

    ldp x29, x30, [sp], #16
    mov w0, #0
    ret
