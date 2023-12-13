.data

outstr: .asciz "%i bottles of beers on the wall, %i bottles of beer!  Take one down, pass it around... \n"
finishstr: .asciz "We're all out of beer!\n"

.text


.global main
main:
    stp x29, x30, [sp, #-16]!

//Init
    mov w19, #4
    //mov w1, #1

//Loop condition
loop:
    cmp w19, #0
    b.le finish

//Loop body
    ldr x0, =outstr
    mov w1, w19
    mov w2, w1
    bl printf
    sub w19, w19, #1
    b loop


//Stuff after loop
finish:
    ldr x0, =finishstr
    bl printf
    ldp x29, x30, [sp], #16
    mov w0, #0
    ret
