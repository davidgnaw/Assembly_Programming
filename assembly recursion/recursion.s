// Emory Honor code statement: (must be a comment to avoid compile error)
//
// THIS CODE IS MY OWN WORK, IT WAS WRITTEN WITHOUT CONSULTING A TUTOR
// OR CODE WRITTEN BY OTHER STUDENTS - Yu Fung David Wang
//
// (Homework version: Fall 2020)

// ====================================================================
// Do not edit the ".global F" line
// ====================================================================
        .global F


// **************************************************************************
// You can add more xdef directives above if you need more external labels
// for debugging (EGTAPI can see .global labels)
//
// - Remember that you can only add a label as a break point (stop location) 
//   in EGTAPI if the label has been xdef'ed !!!
//
// - And I am pretty sure you will need to use break point for debugging 
// - in this project... So add more xdef above to export your breakpoints
// **************************************************************************


/* ************************************************************
   This label marks the address of the recursive function F
   ************************************************************ */
F:

// ********************************************************************
// Put your (recursive) function F here below
//
// F receives the parameters i, j, k on the stack
// F returns the function value in register r0
//
// Make sure you use the "pop {pc}" instruction to return to the caller
//
// Also: Make sure you DE-ALLOCATE the local variables and restore fp
//       BEFORE you return to the caller !!!
// ********************************************************************


	//prelude 
	push	{lr}
	push	{fp}
	mov	fp, sp

	sub	sp, sp, #8 //free up space for two ints (s and t)

	//body
	ldr	r0, [fp, #8] //load i
	mov	r1, #0
	
	cmp	r0, r1
	ble	then //i <= 0

	ldr	r0, [fp, #12] //load j
	mov	r1, #0

	cmp	r0, r1
	bgt	elseif //j > 0

then:
	mov	r1, #-1
	str	r1, [fp, #-4] //s = -1 CHECK THIS
	ldr	r0, [fp, #-4] //return -1 
	
	//postlude
	mov	sp, fp
	pop	{fp}
	pop	{pc}


elseif:
	ldr	r0, [fp, #8] //load i
	ldr	r1, [fp, #12] //load j
	ldr	r2, [fp, #16] //load k

	add	r3, r0, r1 //i + j

	cmp	r3, r2
	bge	else
	
	str	r3, [fp, #-4] //s = i+j CHECK THIS
	ldr	r0, [fp, #-4] //return s

	//postlude
	mov	sp, fp
	pop	{fp}
	pop	{pc}

else:
	mov	r0, #0
	str	r0, [fp, #-4] //s = 0

	mov	r0, #1
	str	r0, [fp, #-8] //t = 1

while:
	ldr	r0, [fp, #-8] //t
	ldr	r1, [fp, #16] //k

	cmp	r0, r1 
	bge	whileEnd //t >= k

	//F(i-t, j-t, k-1)
	ldr	r0, [fp, #16] //k
	sub	r0, r0, #1 //k-1
	push	{r0} //pass param3 (t-1)

	ldr	r0, [fp, #12] //j
	ldr	r1, [fp, #-8] //t
	sub	r0, r0, r1 //j-t
	push	{r0} //pass param2 (j-t)

	ldr	r0, [fp, #8] //i
	ldr	r1, [fp, #-8] //t
	sub	r0, r0, r1 //i-t
	push	{r0} //pass param1 (i-t)
	
	bl	F
	add	sp, sp, #8 //clean up param

	// s = s + F(i-t, j-t, k-1) + 1
	ldr	r1, [fp, #-4]
	add	r0, r0, r1
	add	r0, r0, #1

	str	r0, [fp, #-4]

	//t++
	ldr	r0, [fp, #-8]
	add	r0, r0, #1 
	str	r0, [fp, #-8]

	b	while

whileEnd:
	ldr	r0, [fp, #-4] //return s 
	
	//postlude
	mov	sp, fp
	pop	{fp}
	pop	{pc}





//====================================================================
// Don't add anything below this line...
// ====================================================================
        .end



