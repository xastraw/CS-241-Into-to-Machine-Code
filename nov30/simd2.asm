.data

c1: .word 0x3fc90a4d    //c1
c3: .word 0xbf24aaab    //c3
c5: .word 0x3d94e916    //c5

mynum: .word 0x42340000

num90: .word 0x42B40000



outstr: .asciz "The sine of %1.15f is approx %1.15f.\n"

.text

.global main
main:
    stp x29, x30, [sp, #-16]!


    ldr x0, =mynum
    ldr s0, [x0]    //s0 has 45
    ldr x0, =num90
    ldr s1, [x0]    //s1 has 90

    fdiv s2, s0, s1 //s2 has num/90 == input value "x"
    fmul s3, s2, s2  //s3 has x^2
    
    // polynomial= x(c1 + x^2(c3+c5x^2))

    ldr x0, =c1
    ldr s4, [x0] //s4 has c1
    ldr x0, =c3
    ldr s5, [x0] //s5 has c3
    ldr x0, =c5
    ldr s6, [x0] //s6 has c5

    //computing c3+c5x^2
    fmla s5, s3, s6 //answer is in s5

    //computing c1 + x^2(c3+c5x^2)
    fmla s4, s3, s5 //multiple s3 and s5 and then adding s4, puts the answer in s4

    //computing x(c1 + x^2(c3+c5x^2))
    fmul s2, s2, s4 //final answer is in s2


    //print
    ldr x0, =outstr
    fmov s1, s2  //answer is in s1
    fcvt d0, s0 //takes the single (in s0) and converts it to a double
    fcvt d1, s1
    bl printf


    ldp x29, x30, [sp], #16
    mov w0, #0
    