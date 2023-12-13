.data

mystr: .asciz "%i! = %i\n"
instr1: .asciz "Please input a postive integer. \n"
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
    bl factorial

    mov x1, x20
    mov x2, x0
    ldr x0, =mystr
    bl printf

    ldr x20, [sp], #16
    ldp x29, x30, [sp], #16
    mov w0, #0
    ret


.global factorial
factorial:
    stp x29, x30, [sp, #-16]!
    //base case 
    cmp x0, #1
    b.gt recursivecase
    basecase:
        mov x0, #1
        b end 
    recursivecase:
        // n! = n*(n-1)!
        str x0, [sp, #-16]! //push x0 onto stack
        sub x0, x0, #1
        bl factorial 
        //pass factorial n-1, it returns (n-1)!
        ldr x1, [sp], #16
        mul x0, x0, x1

    end:
    ldp x29, x30, [sp], #16
    ret 
