// Emory Honor code statement: (must be a comment to avoid compile error)
//
// THIS CODE IS MY OWN WORK, IT WAS WRITTEN WITHOUT CONSULTING A TUTOR
// OR CODE WRITTEN BY OTHER STUDENTS - yu Fung David Wang
//
// (Homework version: Fall 2020)

// ********************************************************************
// Do not touch the following 2 lists of global symbols:
// ********************************************************************
        .global main, Stop, CodeEnd
        .global DataStart, DataEnd
        .global A, B, GCD




// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// You can add more .globals HERE to export labels to ARM if you wish
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++







// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//      Put your assembler program between the 'main' and the 'Stop' labels
//
//      DO NOT define any variables here (because the content in the
//	variables will be TREATED (by the computer) as INSTRUCTIONS !!!)
//      If you need extra variables, define them in the "Variable Section"
// 	AFTER the Stop  label
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
main:

	movw	r0, #:lower16:A
	movt	r0, #:upper16:A
	ldr	r1, [r0]
	
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r3, [r2]

	cmp	r1, r3 //(B > A)
	bge	whileInner

	str	r1, [r2]
	str	r3, [r0]

whileInner:

	movw	r0, #:lower16:A
	movt	r0, #:upper16:A
	ldr	r1, [r0]
	
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r3, [r2]

	cmp	r1, r3 //(B < A)
	ble	whileOuter

	sub	r1, r1, r3
	str	r1, [r0]

	b	whileInner

whileOuter:

	movw	r0, #:lower16:A
	movt	r0, #:upper16:A
	ldr	r1, [r0]
	
	movw	r2, #:lower16:B
	movt	r2, #:upper16:B
	ldr	r3, [r2]

	cmp	r1, r3 //(A != B)
	beq	whileEnd

	str	r1, [r2]
	str	r3, [r0]
	

	b	whileInner
	

whileEnd: 

	movw	r0, #:lower16:GCD
	movt	r0, #:upper16:GCD
	
	movw	r1, #:lower16:B
	movt	r1, #:upper16:B

	ldr	r2, [r1] //GCD = B
	str	r2, [r0]

	

         











// ********************************************************************
// Don't touch the Stop and CodeEnd labels - EGTAPI needs them !!!
// ********************************************************************
Stop:   
	nop

CodeEnd:
	nop



// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// **                          Variable Section                           **
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	.data
DataStart:

	





// ********************************************************************
// The following variables ate used as input and output of the program 
// (I have defined them for you already)
// 
// ** Don't touch the variables A, B and GCD below this line !!!
// ********************************************************************
A:      .4byte  68
B:      .4byte  119
GCD:    .skip  4

DataEnd:    
	nop

        .end
