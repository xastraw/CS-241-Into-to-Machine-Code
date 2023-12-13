.data

ctabTaylor64:
  .dword 0x3ff921fb54442d18		//c1
  .dword 0xbfe4abbce625be53		//c3
  .dword 0x3fb466bc6775aae2		//c5
  .dword 0xbf732d2cce62bd86		//c7
  .dword 0x3f250783487ee782		//c9
  .dword 0xbece3074fde8871f		//c11
  .dword 0x3e6e8f434d018d63		//c13
  .dword 0xbe06fadb9f155744		//c15

.text

.global sinpi2x

//sinpi2x calculates a Taylor approximation for sin(pi*x/2) up to x^15
//it can be called from another routine with the desired value of x
//in d0.  It outputs the result to d0 and terminates.
	
sinpi2x:	
	stp x29,x30,[sp,#-16]!
									//d0 	x
	fmul 	d2,d0,d0				//d2	x^2
	fmul	d3,d0,d2				//d3 	x^3
	fmul	d4,d2,d2				//d4	x^4
	fmov	d5,d0					//d5	x^1, v5 [x^1,.]
	
	mov		v4.2d[1],v4.2d[0]		//v4	[x^4,x^4]
	mov		v5.2d[1],v3.2d[0]		//v5	[x^1,x^3]
	fmul	v6.2d,v4.2d,v5.2d		//v6	[x^5,x^7]
	fmul	v7.2d,v6.2d,v4.2d		//v7	[x^9,x^11]
	fmul	v8.2d,v7.2d,v4.2d		//v8	[x^13,x^15]	
	
	ldr 	x0,=ctabTaylor64		
	ld1		{v16.2d},[x0],#16		//v16	[c1,c3]
	ld1		{v17.2d},[x0],#16		//v17 	[c5,c7]
	ld1		{v18.2d},[x0],#16		//v18 	[c9,c11]
	ld1		{v19.2d},[x0],#16		//v19	[c13,c15]

	fmul 	v9.2d,v16.2d,v5.2d		//v9	[c1x,c3x^3]
	fmla	v9.2d,v17.2d,v6.2d		//v9	[c1x+c5x^5,c3x^3+c7x^7]
	fmla	v9.2d,v18.2d,v7.2d		//v9	[c1x+c5x^5+c9x^9,c3x^3+c7x^7+c11x^11]
	fmla	v9.2d,v19.2d,v8.2d		//v9	[c1x+c5x^5+c9x^9+c13x^13,c3x^3+c7x^7+c11x^11+c15x^15]
	faddp	d0,v9.2d				//d0 has sum

	ldp x29,x30,[sp],#16
	ret
    