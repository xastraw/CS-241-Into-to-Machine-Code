.data


.text


.global main
main:
    stp x29, x30, [sp, #-16]!

    //adition instructions: add, abc, adds, abcs



    ldp x29, x30, [sp], #16
    mov w0, #0
    ret
