.data

prmpt: .asciz "Please give a string."
formatstr: .asciz "%[^\n]15s"

inputptr: .dword 0x0
outptr: .dword 0x0

outputprint: .asciz "The orginal string is \"%s\" and the reverse is \"%s\".\n"

.text

.global main
main:
    stp x29, x30, [sp, #-16]!

//getting pointers
    mov w0, #16
    bl malloc

    ldr x1, =inputptr
    str x0, [x1]

    mov w0, #16
    bl malloc
    ldr x1, =outptr
    str x0, [x1]

//userinput
    ldr x0, =prmpt
    bl puts

    ldr x0, =formatstr
    ldr x2, =inputptr
    ldr x1, [x2]
    bl scanf

//getting string length
    ldr x0, =inputptr
    ldr x0, [x0]
    bl stringlength
    //string length is in x0

//reverse the string
    mov x2, x0 //putting string length in x2
    ldr x0, =inputptr
    ldr x0, [x0]
    ldr x1, =outptr
    ldr x1, [x1]
    bl stringReverse

//printing the output
    ldr x0, =outputprint
    ldr x1, =inputptr
    ldr x1, [x1]
    ldr x2, =outptr
    ldr x2, [x2]
    bl printf

//free memory and end
    ldr x1, =inputptr
    ldr x0, [x1]
    bl free
    ldr x1, =outptr
    ldr x0, [x1]
    bl free

    ldp x29, x30, [sp], #16
    mov w0, #0
    ret

.global stringlength
stringlength:
    stp x29, x30, [sp, #-16]!
    mov x2, #0

    lenloop:
        ldrb w1, [x0, x2]
        cbz w1, lenend
        // Loop body goes here
        add x2, x2, #1
        b lenloop

    lenend:
    mov x0, x2
    ldp x29, x30, [sp], #16
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
