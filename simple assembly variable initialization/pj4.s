// Emory Honor code statement: (must be a comment to avoid compile error)
//
// THIS CODE IS MY OWN WORK, IT WAS WRITTEN WITHOUT CONSULTING A TUTOR
// OR CODE WRITTEN BY OTHER STUDENTS - YU FUNG DAVID WANG
//
// (Homework version: Fall 2020)
//
// DO NOT make any changes to these ".global" definitions

	.global main, Stop, CodeEnd
	.global DataStart, DataEnd
	.global Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10
	.global ans_b, ans_s, ans_i, x, y, z

main:

//******************************************************************
// Instructions:
//     1. I have defined the variable ans_b, ans_s, ans_i, x, y, z
//        in the ".data" section at the end of this program.
//        Look at the ".data" section at the end of this file.
//
//     2. There are 10 assignment statements below - each tagged with
//        a label (Q1, Q2, ...) that uses these variables
//
//        Write the assembler instruction to each statement 
//        after (= below) its CORRESPONDING LABEL: Q1, Q2, Q3, ..... Q10
//
//******************************************************************





//*************************************************************************
// Write the assembler instruction at label Q1 that executes this
// high level programming language statement: 
//
//      ans_i = 74;
//
// Do NOT forget to SKIP some space (or tab) before writing assembler code !!!
//*************************************************************************
Q1:
	movw	r0, #:lower16:74
	movt	r0, #:upper16:74

	movw 	r1, #:lower16:ans_i
	movt	r1, #:upper16:ans_i

	str 	r0, [r1]


//*************************************************************************
// Write the assembler instruction at label Q2 that executes this
// high level programming language statement:
//
//      ans_s = 39;
//
// Do NOT forget to SKIP some space (or tab) before writing assembler code !!!
//*************************************************************************
Q2:
	movw	r0, #:lower16:39
	movt	r0, #:upper16:39

	movw 	r1, #:lower16:ans_s
	movt	r1, #:upper16:ans_s

	strh 	r0, [r1]



//*************************************************************************
// Write the assembler instruction at label Q3 that executes this
// high level programming language statement:
//
//      ans_b = -44;
//
// Do NOT forget to SKIP some space (or tab) before writing assembler code !!!
//*************************************************************************
Q3:
	movw	r0, #:lower16:-44
	movt	r0, #:upper16:-44

	movw 	r1, #:lower16:ans_b
	movt	r1, #:upper16:ans_b

	strb 	r0, [r1]




//*************************************************************************
// Write the assembler instruction at label Q4 that executes this
// high level programming language statement:
//
//      ans_i = x;
//
// Do NOT forget to SKIP some space (or tab) before writing assembler code !!!
//*************************************************************************
Q4:
	movw	r0, #:lower16:x
	movt	r0, #:upper16:x
	ldrsb	r1, [r0]

	movw 	r2, #:lower16:ans_i
	movt	r2, #:upper16:ans_i

	str 	r1, [r2]




//*************************************************************************
// Write the assembler instruction at label Q5 that executes this
// high level programming language statement:
//
//      ans_s = x;
//
// Do NOT forget to SKIP some space (or tab) before writing assembler code !!!
//*************************************************************************
Q5:
	movw	r0, #:lower16:x
	movt	r0, #:upper16:x
	ldrsb	r1, [r0]

	movw 	r2, #:lower16:ans_s
	movt	r2, #:upper16:ans_s

	strh 	r1, [r2]




//*************************************************************************
// Write the assembler instruction at label Q6 that executes this
// high level programming language statement:
//
//      ans_b = x;
//
// Do NOT forget to SKIP some space (or tab) before writing assembler code !!!
//*************************************************************************
Q6:
	movw	r0, #:lower16:x
	movt	r0, #:upper16:x
	ldrsb	r1, [r0]

	movw 	r2, #:lower16:ans_b
	movt	r2, #:upper16:ans_b

	strb 	r1, [r2]




//*************************************************************************
// Write the assembler instruction at label Q7 that executes this
// high level programming language statement:
//
//      ans_b = y;   (Note: ans_b will not be equal to y)
//
// Do NOT forget to SKIP some space (or tab) before writing assembler code !!!
//*************************************************************************
Q7:
	movw	r0, #:lower16:y
	movt	r0, #:upper16:y
	ldrsh	r1, [r0]

	movw 	r2, #:lower16:ans_b
	movt	r2, #:upper16:ans_b

	strb 	r1, [r2]




//*************************************************************************
// Write the assembler instruction at label Q8 that executes this
// high level programming language statement:
//
//      ans_s = y;   
//
// Do NOT forget to SKIP some space (or tab) before writing assembler code !!!
//*************************************************************************
Q8:
	movw	r0, #:lower16:y
	movt	r0, #:upper16:y
	ldrsh	r1, [r0]

	movw 	r2, #:lower16:ans_s
	movt	r2, #:upper16:ans_s

	strh 	r1, [r2]





//*************************************************************************
// Write the assembler instruction at label Q9 that executes this
// high level programming language statement:
//
//      ans_s = z;   (Note: ans_s will not be equal to z)
//
// Do NOT forget to SKIP some space (or tab) before writing assembler code !!!
//*************************************************************************
Q9:
	movw	r0, #:lower16:z
	movt	r0, #:upper16:z
	ldr	r1, [r0]

	movw 	r2, #:lower16:ans_s
	movt	r2, #:upper16:ans_s

	strh 	r1, [r2]





//*************************************************************************
// Write the assembler instruction at label Q10 that executes this
// high level programming language statement:
//
//      ans_i = y;     
//
// Do NOT forget to SKIP some space (or tab) before writing assembler code !!!
//*************************************************************************
Q10:
	movw	r0, #:lower16:y
	movt	r0, #:upper16:y
	ldrh	r1, [r0]

	movw 	r2, #:lower16:ans_i
	movt	r2, #:upper16:ans_i

	str 	r1, [r2]





/*************************************************************************
  These labels are needed by EGTAPI to locate the end of the program
 *************************************************************************/

Stop:	
CodeEnd:
	nop



/*************************************************************************
   The variables used by the program instruction have been defined below 

   DO NOT make any changes below this line
 *************************************************************************/


	.data
DataStart:

	.align  
ans_b:  .skip 1			// ans_b is a byte typed variable

	.align  
ans_s:  .skip 2			// ans_s is a short typed variable

	.align  
ans_i:  .skip 4			// ans_i is an int typed variable


	.align			// x is a byte typed variable
x:	.byte  -13


	.align			// y is a short typed variable
y:	.2byte  2057		// 2057 = 2^11 + 9

	.align			// z is an int typed variable
z:	.4byte  147463		// 147463 = 2^17 + 2^14 + 7


DataEnd:
	.end

