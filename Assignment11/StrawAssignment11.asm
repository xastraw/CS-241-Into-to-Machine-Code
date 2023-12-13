.data

numprmpt: .asciz "Please give a positive number. \n"
userprmptnum: .asciz "%lf"
usernum: .dword 0x0

iterprmpt: .asciz "How many times do you want to iterate? \n"
userprmptiter: .asciz "%li"
useriter: .dword 0x0

armvalue: .dword 0x0
armnumerator: .dword 0x3ff0000000000000 // 1.0

finishedprint: .asciz "The fast inverse square root of %1.15f using %li Newton iterations is %1.15f.  The ARM value is %1.15f." 


//invsqrt numbers
magic: .dword 0x5FE6EB50C7B537A9
ex2: .dword 0x0
y: .dword 0x0
i: .dword 0x0
threehalfs: .dword 0x3ff8000000000000 // 3/2
onehalf: .dword 0x3fe0000000000000  // 1/2
.text


.global main
main:
    stp x29, x30, [sp, #-16]!

    //gets user num and makes sure its positive
    bl getUserNum

    //gets user iterations
    ldr x0, =iterprmpt
    bl puts
    ldr x0, =userprmptiter
    ldr x1, =useriter
    bl scanf
    
    //loads variables from finvsqrt
    ldr x5, =usernum
    ldr d0, [x5]
    ldr x6, =useriter
    ldr x0, [x6]
    bl finvsqrt


    //arm invsqrt
    ldr x5, =usernum
    ldr d2, [x5]    //usernum in d2
    ldr x6, =armnumerator
    ldr d1, [x6]    //numerator of 1.0 in d1

    fsqrt d2, d2    //sqrt of usernum
    fdiv d0, d1, d2 // 1.0/sqrt of usernum
    //answer is in d0
    ldr x0, =armvalue
    str d0, [x0]    //answer is now stored in armvalue



    //printing the answers
    ldr x0, =finishedprint
    ldr x5, =usernum
    ldr d0, [x5]
    ldr x6, =useriter
    ldr x1, [x6]
    ldr x7, =y
    ldr d1, [x7]
    ldr x8, =armvalue
    ldr d2, [x8]
    bl printf

    ldp x29, x30, [sp], #16
    mov w0, #0
    ret

.global getUserNum
getUserNum:
    stp x29, x30, [sp, #-16]!

    getinput1:
        ldr x0, =numprmpt
        bl puts
        
        ldr x0, =userprmptnum
        ldr x1, =usernum
        bl scanf

        ldr x1, =usernum
        ldr d0, [x1]
        FCMPE d0, #0.0
        b.gt end1 //if num >0, is pos so go back to main

        b getinput1


    end1:
        ldp x29, x30, [sp], #16
        ret

// float finvsqrt(float number) d0 has the number
.global finvsqrt
finvsqrt:
    stp x29, x30, [sp, #-16]! 
    //usernum is in d0 and useriterations is in x0
    mov x22, x0 //store useriter in x22 for later use

    // x2 = number * 0.5F
    ldr x0, =onehalf
    ldr d1, [x0]
    fmul d2, d0, d1
    ldr x0, =ex2
    str d2, [x0]

    // y = number
    ldr x0, =y
    str d0, [x0]

    // i  = * ( long * ) &y;
    fmov x0, d0
    ldr x1, =i
    str x0, [x1]

    // i  = 0x5f3759df - ( i >> 1 );
    lsr x0, x0, #1 // (i >> 1)
    ldr x2, =magic
    ldr x1, [x2]
    sub x0, x1, x0
    ldr x1, =i
    str x0, [x1]

    // y  = * ( float * ) &i;
    fmov d0, x0
    ldr x1, =y
    str x0, [x1]

    // y  = y * ( threehalfs - ( x2 * y * y ) );
    ldr x0, =threehalfs
    ldr d1, [x0]
    ldr x0, =ex2
    ldr d2, [x0]
    
    mov x2, x22 //counter for # of iterations is in x2
    carmackIteration:
        // so now d0 has y, d1 has 1.5F, and d2 has x2
        fmul d3, d0, d0
        fmul d3, d3, d2
        fsub d3, d1, d3
        fmul d0, d0, d3
        ldr x0, =y
        str d0, [x0]
        // we're done!  yay!

        //math to go thru number of iterations
        sub x2, x2, #1  //subtract one from counter cause its already gone thru it once before it compares it to 0
        cmp x2, #0 
        b.eq carmackEnd //if numiter = 0 end loop, if not keep going

        b carmackIteration

    carmackEnd:
        ldp x29, x30, [sp], #16
        ret
