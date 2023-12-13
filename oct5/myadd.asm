.data

.text


.global myadd
myadd:
    stp x29, x30, [sp, #-16]!
    add w0, w0, w1
    ldp x29, x30, [sp], #16
    ret
