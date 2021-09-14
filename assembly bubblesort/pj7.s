/* =============================================================

   **** WARNING: DO NOT make any change to this file !!! ***** 

            Don't even put the Honor code in this file, because
	    you DO NOT turn in file in !

   You need to edit the file bubblesort.s  for this project !!!
   ============================================================= */

        .global main, sortB, Stop, CodeEnd
	.global DataStart, DataEnd
        .global A, B

        .global BubbleSort

//****************************************************************************
// Main program: call BubbleSort twice to sort 2 different arrays
//	 	and print the sorted arrays out
//
// DO NOT change the main program.
// Write your BubbleSort routine in the "bubblesort.s" file !!!
//****************************************************************************
main:
	movw	r0, #:lower16:A		// Pass address of the array A in r0
	movt	r0, #:upper16:A
	mov	r1, #5			// Pass size of the array in r1
	bl	BubbleSort		// Sort array A


sortB:
	nop

	movw	r0, #:lower16:B		// Pass address of the array B in r0
	movt	r0, #:upper16:B
	mov	r1, #10			// Pass size of the array in r1
	bl	BubbleSort		// Sort array B



Stop:	
	nop
CodeEnd:
        nop


// ============================================================================

	.data
DataStart:

// ********************************************************************
// Don't touch the arrays A and B below
// ********************************************************************
A:      .4byte 6,-3,-8,4,11
B:      .4byte 78,-1,8,45,11,-89,56,9,12,-19


// ********************************************************************
// You can add more variables below if you need them
// ********************************************************************





DataEnd:
	.end

