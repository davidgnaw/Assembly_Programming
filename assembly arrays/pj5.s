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
	.global A, B, C
	.global i, j, k
	.global head
	.global ans_b, ans_s, ans_i

main:
//******************************************************************
// Instructions:
//     1. I have defined the variable ans_b, ans_s, ans_i, and
//        a number of simple variables (i,j,k), arrays (A,B,C)and 
//        a linked list (head) in the ".data" section at the end 
//        of this program.
//        Look at the ".data" section at the end of this file for details
//
//     2. There are 10 assignment statements below - each tagged with
//        a label (Q1, Q2, ...) that uses these variables
//
//        Write the assembler instruction to each statement
//        after (= below) its CORRESPONDING LABEL: Q1, Q2, Q3, ..... Q10
//
//******************************************************************


Q1:

// Write assembler instruction here to execute the following statement:
//         ans_s = B[5]
	
	movw	r0, #:lower16:B
	movt	r0, #:upper16:B

	ldrsh	r1, [r0, #10] // 5 * 2 (short)
	
	movw	r2, #:lower16:ans_s
	movt	r2, #:upper16:ans_s
	
	strh	r1, [r2]



Q2:

// Write assembler instruction here to execute the following statement:
//         ans_b = A[3];

	movw	r0, #:lower16:A
	movt	r0, #:upper16:A

	ldrsb	r1, [r0, #3] // 3 * 1 (byte)
	
	movw	r2, #:lower16:ans_b
	movt	r2, #:upper16:ans_b
	
	strb	r1, [r2]



Q3:

// Write assembler instruction here to execute the following statement:
//         ans_i = C[j];

	movw	r0, #:lower16:C
	movt	r0, #:upper16:C

	movw	r3, #:lower16:j
	movt	r3, #:upper16:j

	ldrsh	r3, [r3] // load j
	// offset j to int
	add	r3, r3, r3
	add	r3, r3, r3
	
	ldr	r4, [r0, r3]
	
	movw	r2, #:lower16:ans_i
	movt	r2, #:upper16:ans_i
	
	str	r4, [r2]






Q4:

// Write assembler instruction here to execute the following statement:
//         ans_i = B[k - j]; 


	movw	r0, #:lower16:B
	movt	r0, #:upper16:B

	movw	r1, #:lower16:j
	movt	r1, #:upper16:j

	ldrsh	r1, [r1] // load j
	add	r1, r1, r1 // offset

	movw	r2, #:lower16:k
	movt	r2, #:upper16:k

	ldr	r2, [r2] // load k
	add 	r2, r2, r2 // offset

	sub	r4, r2, r1

	ldrsh	r4, [r0, r4]

	movw	r3, #:lower16:ans_i
	movt	r3, #:upper16:ans_i

	str	r4, [r3]



Q5:

// Write assembler instruction here to execute the following statement:
//         ans_s = C[i + j]; 


	movw	r0, #:lower16:C
	movt	r0, #:upper16:C

	movw	r1, #:lower16:j
	movt	r1, #:upper16:j
	//offset to int array C
	ldrsh	r1, [r1] 
	add	r1, r1, r1
	add	r1, r1, r1

	movw	r2, #:lower16:i
	movt	r2, #:upper16:i
	//offset to int array C
	ldrsb	r2, [r2]
	add 	r2, r2, r2
	add	r2, r2, r2
	// i + j
	add	r4, r2, r1

	ldr	r4, [r0, r4]

	movw	r3, #:lower16:ans_s
	movt	r3, #:upper16:ans_s

	strh	r4, [r3]



Q6:

// Write assembler instruction here to execute the following statement:
//         ans_i = A[k] - B[k];

	movw	r0, #:lower16:k
	movt	r0, #:upper16:k

	movw	r1, #:lower16:A
	movt	r1, #:upper16:A

	movw	r2, #:lower16:B
	movt	r2, #:upper16:B

	ldr	r0, [r0]

	ldrsb	r3, [r1, r0]
	
	//offset to short B array
	add	r0, r0, r0
	ldrsh	r4, [r2, r0]

	sub	r5, r3, r4

	movw	r6, #:lower16:ans_i
	movt	r6, #:upper16:ans_i

	str	r5, [r6]


Q7:

// Write assembler instruction here to execute the following statement:
//         ans_s = B[A[i] - 30];

	movw	r0, #:lower16:B
	movt	r0, #:upper16:B

	movw	r1, #:lower16:A
	movt	r1, #:upper16:A

	movw	r2, #:lower16:i
	movt	r2, #:upper16:i

	// get A[i]
	ldrsb	r2, [r2] // load i
	ldrsb	r3, [r1, r2]

	// subtract by 30
	sub	r3, r3, #30 

	// get B[A[i] - 30]
	add	r3, r3, r3
	ldrsh	r4, [r0, r3]

	movw	r5, #:lower16:ans_s
	movt	r5, #:upper16:ans_s
	strh	r4, [r5]



Q8:

// Write assembler instruction here to execute the following statement:
//         ans_s = B[18];

	movw	r0, #:lower16:B
	movt	r0, #:upper16:B

	ldrsh	r1, [r0, #36] 
	
	movw	r2, #:lower16:ans_s
	movt	r2, #:upper16:ans_s
	
	strh	r1, [r2]
	// result in ans_s is 5555 because accessing out of bounds of short array B
	// after traversing B short array, it uses 9 * 2 = 18 offset
	// has 18 offset left so traverses C int array where index 18 / 4 = 4.5 ~ 5 is pointed to
	// C[5] = 5555



Q9:

// Write assembler instruction here to execute the following statement:
//	  ans_b = head.value2;

	movw	r0, #:lower16:head
	movt	r0, #:upper16:head

	movw	r1, #:lower16:ans_b
	movt	r1, #:upper16:ans_b

	ldr	r0, [r0]

	ldrsh	r2, [r0, #4] // load 2nd value (short) in list1
	strb	r2, [r1]
	






Q10:

// Write assembler instruction here to execute the following statement:
//	  ans_s = head.next.next.value3;


	movw	r0, #:lower16:head
	movt	r0, #:upper16:head

	movw	r1, #:lower16:ans_s
	movt	r1, #:upper16:ans_s

	ldr	r0, [r0]
	ldr	r0, [r0, #8] // head.next
	ldr	r0, [r0, #8] // head.next.next

	ldrsh	r2, [r0, #6] // load 3rd value (short) in list3
	strh	r2, [r1]






//************************************************
// Don't write any code below this line
//************************************************

Stop:	nop

CodeEnd:
	nop





//***********************************************************************
// Data segment
//***********************************************************************

	.data
DataStart:
//***********************************************************************
// I have defined the ans_b, ans_s and ans_i variables below this line
//
// Don't touch these variables !!!!
// Also: you do NOT need to define any more variables !!!
//***********************************************************************
	.align
ans_b:  .skip  1		// ans_b is a byte typed variable

	.align
ans_s:  .skip  2		// ans_s is a short typed variable

	.align
ans_i:  .skip  4		// ans_i is an int typed variable

	.align
i:      .byte  2		// byte i = 2;

	.align
j:      .2byte 3		// short j = 3;

	.align
k:      .4byte 4		// int k = 4;

// arrays  A (byte), B(short) and C(int)
	.align
A:      .byte     11, -22, 33, -44, 55, -66, 77, -88, 99, -123

	.align
B:      .2byte    111, -222, 333, -444, 555, -666, 777, -888, 999, -5432

	.align
C:      .4byte  1111, -2222, 3333, -4444, 5555, -6666, 7777, -8888, 9999, -9876

// Linked list
//
// head ->[1234,89,-11]->[2345,78,66]->[-3456,67,44]->[4567,56,77]->[5678,45,44]

	.align 4
head:   .4byte  list1

list3:  .4byte  -3456
        .2byte  67
        .2byte  44
	.4byte  list4

list2:  .4byte  2345
        .2byte  78
        .2byte  66
	.4byte  list3

list4:  .4byte  4567
        .2byte  56
        .2byte  77
	.4byte  list5

list1:  .4byte  1234
        .2byte  89
        .2byte  -11
	.4byte  list2

list5:  .4byte  5678
        .2byte  45
        .2byte  44
	.4byte  0

DataEnd:
	.end

