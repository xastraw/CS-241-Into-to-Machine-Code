.data

hellostr: .asciz "Hello, world!"
goodbye: .asciz "Goodbye, cruel world!"

.text

.global main
main:
    stp x29, x30, [sp, #-16]!

    mov x0, #0

    //check if x0 = 0 or not
    mov x1, #0
    cmp x0, x1 //does x1 - x0, discards result, sets flags
    b.eq printhello
    b printgoodbye



    printhello:
    ldr x0, =hellostr
    bl puts
    
    printgoodbye:
    ldr x0, =goodbye
    bl puts

    finish:
    


    ldp x29, x30, [sp], #16
    mov w0, #0
    ret
    