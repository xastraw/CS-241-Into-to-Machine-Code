.data

magic: .word 0x5F3759DF
ex2: .word 0x0
y: .word 0x0
i: .word 0x0
threehalfs: .word 0x3FC00000
onehalf: .word 0x3F000000

.text

// float finvsqrt(float number) s0 has the number
.global finvsqrt
finvsqrt:
    stp x29, x30, [sp, #-16]! 

    // x2 = number * 0.5F
    ldr x0, =onehalf
    ldr s1, [x0]
    fmul s2, s0, s1
    ldr x0, =ex2
    str s2, [x0]
    // y = number
    ldr x0, =y
    str s0, [x0]
    // i  = * ( long * ) &y;
    fmov w0, s0
    ldr x1, =i
    str w0, [x1]
    // i  = 0x5f3759df - ( i >> 1 );
    lsr w0, w0, #1 // (i >> 1)
    ldr x2, =magic
    ldr w1, [x2]
    sub w0, w1, w0
    ldr x1, =i
    str w0, [x1]
    // y  = * ( float * ) &i;
    fmov s0, w0
    ldr x1, =y
    str s0, [x1]
    // y  = y * ( threehalfs - ( x2 * y * y ) );
    ldr x0, =threehalfs
    ldr s1, [x0]
    ldr x0, =ex2
    ldr s2, [x0]
    // so now s0 has y, s1 has 1.5F, and s2 has x2
    fmul s3, s0, s0
    fmul s3, s3, s2
    fsub s3, s1, s3
    fmul s0, s0, s3
    ldr x0, =y
    str s0, [x0]
    // we're done!  yay!

    ldp x29, x30, [sp], #16
    ret
