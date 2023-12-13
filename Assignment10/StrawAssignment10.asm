.data


prmpt: .asciz "Please give a integer. \n"
userint: .asciz "%i"
usernum: .dword 0x0

outptr: .dword 0x0

finalprint: .asciz "The integer is %i and the string is %s.\n"

.text

.global main
main:
    stp x29, x30, [sp, #-16]!

    mov x0, #32
    bl malloc
    ldr x1, =outptr
    str x0, [x1] 

    ldr x0, =prmpt
    bl puts

    ldr x0, =userint
    ldr x1, =usernum
    bl scanf
    
    ldr x5, =usernum
    ldr x0, [x5]
    ldr x4, =outptr
    ldr x1, [x4]
    //x0 has usernum and x1 has outptr
    bl intToStr    

    //prints results
    ldr x0, =finalprint
    ldr x5, =usernum
    ldr x1, [x5]
    ldr x6, =outptr
    ldr x2, [x6]
    bl printf
    

    //frees memory
    ldr x1, =outptr
    ldr x0, [x1]
    bl free

    ldp x29, x30, [sp], #16
    mov w0, #0
    ret


.global stringReverse
stringReverse:
    stp x29, x30, [sp, #-16]!
    //ptr1 is in x0
    //ptr2 is in x1
    //strlen is in x2
    sub x2, x2, #1 //subtract 1 from strlen bc of null terminator
    mov x3, #0

    
    loop:
        //we want to take what is in ptr1[strlen] and add it to ptr2
        ldrb w4, [x0, x2]
        strb w4, [x1, x3]
        cbz x2, end
        //when x3 = 0, end loop
        sub x2, x2, #1
        add x3, x3, #1
        b loop

    end:
        add x3, x3, #1
        strb wzr, [x1, x3]
        //adds nul terminator back into string
        ldp x29, x30, [sp], #16
        ret

.global intToStr
intToStr:
    stp x29, x30, [sp, #-16]!
    //x0 has the int and x1 has the pointer
    mov x20, x0 //store userint for permanent use

    mov x0, #32
    bl malloc
    mov x3, x0 //temporary pointer is in x3 now

    //check if userint is negative
    mov x10, #0 //temp num to say if userint is +/-, 0 means positive, 1 means negative
    mov x0, x20 //moves userint to x0
    sxtw x0, w0 //makes it so it will compare the actual number in signed 2s
    cmp x0, #0 //if userint >= 0, then positive number
    bge positiveInt 

    mov x10, #1 //int is negative so set x10 to 1
    neg x0, x0  //negates x0

    //counter variables bc now num in x0 and x20 are different
    mov x2, #10
    mov x4, #0
    b convertLoop


positiveInt:
    mov x0, x20 //move userint into x0
    mov x2, #10 //base 10 converter for ascii in x2
    mov x4, #0 //counter for # of digits in usernum in x4

convertLoop: //converts int number to string in reverse
    sdiv x5, x0, x2 // x5 = usernum/10
    msub x6, x5, x2, x0 //x6 = x5 *x2 - x0
    add x6, x6, '0' //converts the remainder into ascii

    strb w6, [x3, x4]  //store ascii character into pointer offset by x4
    add x4, x4, #1 //increment digit counter for digits in usernum
    mov x0, x5 //set x0 to the quotient of usernum/10

    cmp x0, #0      //check if quotient is 0 and if not then go again
    bne convertLoop
    //x4 has # of digits
    //x3 is pointer that has string in it (reversed)

    cmp x10, #0
    b.eq finalConvert //if x10=0 then number is positive so no need for negative sign

    mov w8, '-'
    strb w8, [x3, x4]
    add x4, x4, #1 //incr length bc of '-' sign

finalConvert:
    strb wzr, [x3, x4]//add nul terminator to end of string

    //for string reverse
    //inputptr is in x0
    //returnptr is in x1
    //strlen is in x2
    mov x0, x3 //moves pointer of string in x3 to x0
    ldr x7, =outptr
    ldr x1, [x7] //return pointer in x1
    mov x2, x4 //# of digits in x2
    bl stringReverse
    //now reversed string is in pointer in x1

    ldp x29, x30, [sp], #16
    ret
