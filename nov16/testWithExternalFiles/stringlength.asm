.data

.text

//int stringlength(char mystring[])
.global stringlength
stringlength:
    stp x29, x30, [sp, #-16]!
    mov x2, #0
    //x2 is counter

    loop:
        ldrb w1, [x0, x2] //load byte that is at memory address in x0 gets put in w1
        //takes memory address of x0 and then offsets it by x2
        cbz w1, end //compare and branch on zero
        //loop body goes here
        add x2, x2, #1
        b loop

    end:
    mov x0, x2
    ldp x29, x30, [sp], #16
    ret
