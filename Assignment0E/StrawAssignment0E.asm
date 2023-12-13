.data

sumstring: .asciz "The sum of 0x%016lx%016lx and 0x%016lx%016lx is 0x%016lx%016lx.\n"
nocarrystr: .asciz "No final carry occurred\n"
carrystr: .asciz "A final carry occurred\n" 

XH: .dword 0x0000000000000000
XL: .dword 0xFFFFFFFFFFFFFFFF
YH: .dword 0x0000000000000000
YL: .dword 0x0000000000000001


.text


.global main
main:
    stp x29, x30, [sp, #-16]!
    

    ldr x0, =sumstring

    ldr x20, =XH
    ldr x1, [x20]
    ldr x19, =XL
    ldr x2, [x19]
    
    ldr x18, =YH
    ldr x3, [x18]
    ldr x17, =YL
    ldr x4, [x17]

    //x6 = ZL
    //x5 = ZH

    //low calulation math
    adds x6, x2, x4  //ZL= XL+YL

    //high calculation math
    adcs x5, x1, x3 //zh = xh+yh


    b.cs carry //branches if there is a carry
    bl printf 
    //prints sum statement

    ldr x0, =nocarrystr
    bl printf
    b end


carry:
    bl printf 
    //prints sum statement

    ldr x0, =carrystr
    bl printf
    b end

end: 
    ldp x29, x30, [sp], #16
    mov w0, #0
    ret
