.data

mystr: .asciz "The sum is %i. \n"

.text


.global main
main:
    stp x29, x30, [sp, #-16]!

    mov w0, #5
    mov w1, #3
    bl myfunc

    mov w1, w0
    ldr x0, =mystr
    bl printf


    ldp x29, x30, [sp], #16
    mov w0, #0
    ret


.global myfunc
myfunc:
    
    add w0, w0, w1
    ret
