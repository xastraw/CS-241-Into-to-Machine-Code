.data

strpositive: .asciz "Positive\n"
strnegative: .asciz "Negative\n"
strzero: .asciz "Zero\n"

.text


.global main
main:
    stp x29, x30, [sp, #-16]!

    //def number
    mov w0, #5

    //compare to 0
    cmp w0, #0
    b.gt positive
    b.lt negative
    b.eq zero
    

//if # positive
positive:
    ldr x0, =strpositive
    bl printf
    b finish

//if # negative
negative:
    ldr x0, =strnegative
    bl printf
    b finish

//if # zero
zero:
    ldr x0, =strzero
    bl printf
    b finish


finish:
    ldp x29, x30, [sp], #16
    mov w0, #0
    ret
