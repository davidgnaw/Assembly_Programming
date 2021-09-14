// Emory Honor code statement: (must be a comment to avoid compile error)
//
// THIS CODE IS MY OWN WORK, IT WAS WRITTEN WITHOUT CONSULTING A TUTOR
// OR CODE WRITTEN BY OTHER STUDENTS - Yu Fung David Wang
//
// (Homework version: Fall 2020)


        .global BubbleSort


BubbleSort:
//*****************************************************
// Write your bubble sort assembler subroutine here
//
//    BubbleSort: input  r0 = address of int array
//                       r1 = # elements in the array
//*****************************************************
        // Write your bubble sort function here.....
	// Make sure you RETURN to the caller !!!

	mov     r2, #0   

	movw	r8, #:lower16:Done
	movt	r8, #:upper16:Done
	str	r2, [r8]

	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	str	r2, [r9]
	
	mov	r2, #1

	movw	r10, #:lower16:k
	movt	r10, #:upper16:k
	str	r2, [r10]


while:
	movw	r2, #:lower16:Done
	movt	r2, #:upper16:Done
	ldr	r2, [r2]

	cmp	r2, #0
	bne	whileEnd

	mov	r2, #1
	str	r2, [r8] //change Done to true

while2:
	movw    r2, #:lower16:i
        movt    r2, #:upper16:i 
	ldr	r3, [r2]

	movw    r2, #:lower16:k
        movt    r2, #:upper16:k
	ldr	r4, [r2]

	sub	r5, r1, r4 

	cmp	r3, r5 // i >= N - k
	bge	whileEnd2

	//offset for A[i]
	add	r3, r3, r3
	add	r3, r3, r3
	ldr	r6, [r0, r3]

	//offset for A[i+1]
	add	r3, r3, #4 //i+1 * 4
	ldr	r7, [r0, r3] 

	cmp	r6, r7 // A[i] <= A[i + 1] 
	bgt	exchange

	//update variable i
updatei:
	mov	r2, #0
	str	r2, [r8] //change done to false

	movw    r2, #:lower16:i
        movt    r2, #:upper16:i 
	ldr	r3, [r2]

	add	r2, r3, #1
	str	r2, [r9] //i++
	

	b	while2

exchange:
	//exchange A[i] and A[i + 1] and passing into return register
	movw    r2, #:lower16:i
        movt    r2, #:upper16:i 
	ldr	r3, [r2]

	add	r3, r3, r3
	add	r3, r3, r3
	str	r7, [r0, r3] //return array in r0

	add	r3, r3, #4
	str	r6, [r0, r3] //return array in r0

	b	updatei

whileEnd2:
	add	r2, r4, #1 
	str	r2, [r10] //k++

	//make i = 0 again
	movw    r2, #:lower16:i
        movt    r2, #:upper16:i 
	ldr	r3, [r2]

	mov	r2, #0
	str	r2, [r9] //i++
	
	b	while
	
whileEnd:

	mov     pc, lr //return to caller once done sorting array
	
	
	
	

	

	
	








	.data
// *************************************************************************
// If you need local variables, you can define them below this line
// *************************************************************************



Done:	.skip 4
k:	.skip 4
i:	.skip 4







        .end
