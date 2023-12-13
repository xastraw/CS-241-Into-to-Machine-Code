//sim2 converted to use 64bit numbers and also read from a list
.data

ctabApollo64:
  .dword 0x3ff92149914389c3
  .dword 0xbfe49555673aa1bc
  .dword 0x3fb29d22bb15eb24

mynum: .dword 0x4046800000000000 //45.0
num90: .dword 0x4056800000000000

outstr: .asciz "The sine of %1.15f is approx %1.15f.\n"

.text
.global main
main:

    stp x29, x30, [sp, #-16]!


    ldr x0, =mynum
    ldr d0, [x0]    //s0 has 45
    ldr x0, =num90
    ldr d1, [x0]    //s1 has 90

    fdiv d0, d0, d1 //d0 has num/90 == input value "x"
    fmul d1, d0, d0 //d1 has x^2

    // polynomial: x(c1 + x^2(c3+c5x^2))
    //need to load c1 into d2, c3 into d3, c5 into d4
    ldr x0, =ctabApollo64
    ldr d2, [x0, #0]    //c1
    ldr d3, [x0, #8]    //c3
    ldr d4, [x0, #16]   //c5

    
    fmul d4, d4, d1 //computing c5 * x^2 and putting answer where c5 is
    
    fadd d3, d3, d4 //computing c3 + (c5 * x^2), putting answer where c3 is
    
    fmul d3, d1, d3 //computing x^2 * (c3 + (c5 * x^2)), putting answer in d3
    
    fadd d3, d2, d3 //computing c1+ (x^2 * (c3 + (c5 * x^2))), putting answer where c1 is

    //computing x * (c1+ (x^2 * (c3 + (c5 * x^2)))), putting answer in d0
    fmul d0, d0, d3

    // print
    ldr x0, =outstr

    fmov d1, d0
    ldr x3, =mynum
    ldr d0, [x3]    //s0 has 45
    bl printf


    ldp x29, x30, [sp], #16
    mov w0, #0
    ret
