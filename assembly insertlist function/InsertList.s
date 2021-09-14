// Emory Honor code statement: (must be a comment to avoid compile error)
//
// THIS CODE IS MY OWN WORK, IT WAS WRITTEN WITHOUT CONSULTING A TUTOR
// OR CODE WRITTEN BY OTHER STUDENTS - Yu Fung David Wang
//
// (Homework version: Fall 2020)

	.global InsertList

InsertList:

// ********************************************************************
// Put your InsertList function here 
// ********************************************************************

	push	{lr}
	push	{fp}
	mov	fp, sp
	sub	sp, sp, #0 //no local

	ldr	r0, [fp, #8] //calling for head
	cmp	r0, #0	//h == null
	beq	then

	ldr	r0, [fp, #8] //calling for head
	ldr	r0, [r0, #0] //r0 = head.value

	ldr	r1, [fp, #12] //calling for element
	ldr	r1, [r1, #0] //r1 = e.value

	cmp	r0, r1 //h.value < e.value
	blt	else

then:
	ldr	r0, [fp, #8] //calling for head

	ldr	r1, [fp, #12] //calling for e
	str	r0, [r1, #4] //e.next = head

	ldr	r0, [fp, #12] //store r0 as return value (e) 
	//return e
	mov	sp, fp
	pop	{fp}
	pop	{pc}
	

else: //h.next = InsertList(h.next, e)

	ldr	r0, [fp, #12] //calling for e
	push	{r0} //pass e to stack as second param

	ldr	r0, [fp, #8] //calling for head
	ldr 	r0, [r0, #4] //h.next
	push	{r0} //pass h.next to stack as first param

	bl	InsertList //branch back
	add	sp, sp, #8 //clean up parameters

	ldr	r1, [fp, #8] //calling for head
	str	r0, [r1, #4] //h.next has the return value from recurs

	ldr	r0, [fp, #8] //r0 has return value (h)
	//return h
	mov	sp, fp
	pop	{fp}
	pop	{pc}



	
	













	.end
