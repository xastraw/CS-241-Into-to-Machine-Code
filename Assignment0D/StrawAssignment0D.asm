.data

mystr: .asciz "Fibonacci number %i is %i\n"
instr1: .asciz "Please input a postive integer."
instr2: .asciz "%li"
mynum: .dword 0x0

.text


.global main
main:
    stp x29, x30, [sp, #-16]!
    str x20, [sp, #-16]!

    ldr x0, =instr1
    bl puts

    ldr x0, =instr2 
    ldr x1, =mynum
    bl scanf

    ldr x1, =mynum
    ldr x0, [x1]

    mov x20, x0
    bl fibonacci


    mov x1, x20
    mov x2, x0
    ldr x0, =mystr
    bl printf



    ldr x20, [sp], #16
    ldp x29, x30, [sp], #16
    mov w0, #0
    ret 



.global fibonacci
fibonacci:
    stp x29, x30, [sp, #-16]!

    //base case
    cmp x0, #2
    b.gt recursivecase

    basecase:
        //if n <= 2, n=1
        mov x0, #1
        b end

    recursivecase:
        //n = F(n-1) + F(n-2)
        sub x0, x0, #1
        str x0, [sp, #-16]!
        bl fibonacci

        mov x1, x0
        ldr x0, [sp], #16
        str x1, [sp, #-16]!
        sub x0, x0, #1
        bl fibonacci

        ldr x1, [sp], #16
        add x0, x0, x1

        

    end:
    ldp x29, x30, [sp], #16
    ret 
