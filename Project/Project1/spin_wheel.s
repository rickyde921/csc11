/* Spin_Wheel */

.data
/* none */
 
.text
 
.globl spin_wheel
spin_wheel:
	str lr, [sp,#-4]!               /* Push lr onto the top of the stack */
	str r1, [sp,#-4]!		/* store bet amount at top of stack */
	str r2, [sp,#-4]!		/* store bet value on top of stack */

	cmp r3, #1			/* if user bet for single number */
	beq _b_single
	cmp r3, #2			/* if user bet for even/odd */
	beq _b_even_odd
	cmp r3, #3			/* if user bet for color */
	beq _b_color
	cmp r3, #4			/* if user bet for box */
	beq _b_box
	cmp r3, #5			/* if user brt for column */
	beq _b_column
	cmp r3, #6			/* if user bet on row */
	beq _b_row

	bal _spin_done

	/* At this point, r0= number spun, r1=bet amount, r2=bet value, r3=bet type */

	_b_single:
	add sp, sp, #+4                 /* discard bet value from stack */
        add sp, sp, #+4                 /* discard bet amount from stack */
	cmp r0, r2			/* if number spun = number chosen */
	beq _win_single			/* won single number bet */
	/* else */
	mov r3, #0			/* coins won = 0 */
	bal _spin_done
	_win_single:
	mov r2, #36			/* win payoff is X36 */
	mul r3 ,r1, r2			/* multiply bet amount by 36 and store onto r0 */
	bal _spin_done

	_b_even_odd:
	mov r2, r0			/* move the number spun into r2 */
	mov r3, #2			/* number the number spun will be div/moded by */
	bl div_mod

	ldr r0, [sp]			/* load bet value onto r0 */
	add sp, sp, #+4                 /* Discard the bet value we kept in the stack */

	cmp r1, #0			/* if number spun is even */
	beq _is_even
	cmp r1, #1			/* if number spun is odd */
	beq _is_odd
	bal _spin_done
	_is_even:
	cmp r0, #2			/* if user bet even */
	beq _win_even_odd
	/* else */
        add sp, sp, #+4                 /* Discard the bet amount we kept in the stack */
	mov r3, #0			/* coins won = 0 */
	bal _spin_done
	_is_odd:
	cmp r0, #1			/* if user bet odd */
	beq _win_even_odd
	/* else */
        add sp, sp, #+4                 /* Discard the bet amount we kept in the stack */
	mov r3, #0			/* coins won = 0 */
	bal _spin_done
	_win_even_odd:
	ldr r0, [sp]			/* load r0 with bet amount */
	mov r1, #2			/* win payoff is X2 */
	mul r3, r0, r1			/* multiply bet amount by 2 */
	add sp, sp, #+4                 /* Discard the bet amount we kept in the stack */
	bal _spin_done			/*finished */

	_b_color:
	cmp r0, #0                      /* if number spun = 0 */
        beq _zero_double_zero
        cmp r0, #37                     /* if number spun = 00 */
        beq _zero_double_zero
	/* really borring way to determine color but there is no good definate color pattern so oh well */
	cmp r0, #1			/* if number is red */
	beq _is_red
	cmp r0, #3                      /* if number is red */
        beq _is_red
	cmp r0, #5                      /* if number is red */
        beq _is_red
	cmp r0, #7                      /* if number is red */
        beq _is_red
	cmp r0, #9                      /* if number is red */
        beq _is_red
        cmp r0, #12                     /* if number is red */
        beq _is_red
        cmp r0, #14                     /* if number is red */
        beq _is_red
        cmp r0, #16                     /* if number is red */
        beq _is_red
	cmp r0, #18                     /* if number is red */
        beq _is_red
        cmp r0, #19                     /* if number is red */
        beq _is_red
        cmp r0, #21                     /* if number is red */
        beq _is_red
        cmp r0, #23                     /* if number is red */
        beq _is_red
	cmp r0, #25                     /* if number is red */
        beq _is_red
        cmp r0, #27                     /* if number is red */
        beq _is_red
        cmp r0, #30                     /* if number is red */
        beq _is_red
        cmp r0, #32                     /* if number is red */
        beq _is_red
	cmp r0, #34                     /* if number is red */
        beq _is_red
        cmp r0, #36                     /* if number is red */
        beq _is_red
  	/* else, its black */
	bal _is_black
	_is_red:
	mov r0, #1			/* rolled color is red */
	bal _continue_color
	_is_black:
	mov r0, #2			/* rolled color is black */
	bal _continue_color
	_continue_color:
	ldr r1, [sp]			/* load r1 with bet value */
	add sp, sp, #+4			/* discard bet value from stack */
	cmp r0, r1			/* if rolled color = chosen color */
	beq _win_color
	/* else */
	add sp, sp, #+4			/* discard bet amount from stack */
	mov r3, #0			/* coins won = 0 */
	bal _spin_done
	_win_color:
	ldr r0, [sp]			/* load r0 with bet amount */
	add sp, sp, #+4			/* discard bet amount from stack */
	mov r1, #2			/* win payoff is X2 */
	mul r3, r0, r1			/* multiply bet amount by 2 */
	bal _spin_done

	_b_box:
	cmp r0, #0			/* if number spun = 0 */
	beq _zero_double_zero
	cmp r0, #37			/* if number spun = 00 */
	beq _zero_double_zero
	/* else */
	sub r0, r0, #1			/* subtract number rolled by 1 */
	mov r2, r0			/* move into r2 number rolled -1 */
	mov r3, #12			/* move 12 into r3 to mod number */
	bl div_mod			/* divide */

	add r0, r0, #1			/* add 1 to diveded answer */
	ldr r1, [sp]			/* load r1 with bet value */
	add sp, sp, #+4			/* Discard the bet value we kept in the stack */

	cmp r0, r1			/* if box spun = box chosen */
	beq _win_box
	/* else */
	add sp, sp, #+4			/* discard bet amount we kept in the stack */
	mov r3, #0			/* coins won = 0 */
	bal _spin_done
	_win_box:
	ldr r0, [sp]			/* load r0 with bet amount */
	mov r1, #3			/* win payoff is X3 */
	mul r3, r0, r1			/* multiply bet amount by 3 */
	add sp, sp, #+4			/* discard bet amount we kept in the stack */
	bal _spin_done

	_b_column:
        cmp r0, #0                      /* if number spun = 0 */
        beq _zero_double_zero
        cmp r0, #37                     /* if number spun = 00 */
	/* else */
	sub r0, r0, #1			/* subtract r0 by 1 */
	mov r2, r0			/* move number rolled -1 into r2 */
	mov r3, #3			/* move 3 into r3 to divide be 3 */
	bl div_mod			/* divide */

	add r0, r0, #1			/* add 1 to divided answer */
	ldr r1, [sp]			/* load r1 with bet value */
	add sp, sp, #+4			/* discard bet value from stack */

	cmp r0, r1			/* if column spun = column chosen */
	beq _win_column
	/* else */
	add sp, sp, #+4			/* remove bet amount from stack */
	mov r3, #0			/* coins won = 0 */
	bal _spin_done
	_win_column:
	ldr r0, [sp]			/* load r0 with bet amount */
	mov r1, #12			/* win payoff is X12 */
	mul r3, r0, r1			/* multiply bet amount by 12 */
	add sp, sp, #+4			/* discard bet amount from stack */
	bal _spin_done

	_b_row:
	mov r2, r0			/* move into r2 the number spun */
	mov r3, #3			/* move into r3 3 to get the mod */
	bl div_mod			/* modual */

	cmp r1, #0			/* if modded answer = 0 */
	beq _row_3
	bal _continue_row		/* else, continue */
	_row_3:
	mov r1, #3			/* rolled number is in 3rd row */
	bal _continue_row
	_continue_row:
	ldr r0, [sp]			/* load bet value onto r0 */
	add sp, sp, #+4			/* discard bet value from stack */
	cmp r0, r1			/* if row rolled = row chosen */
	beq _win_row
	/* else */
	add sp, sp, #+4			/* discard bet amount from stack */
	mov r3, #0			/* coins won = 0 */
	bal _spin_done
	_win_row:
	ldr r0, [sp]			/* load bet amount to r0 */
	add sp, sp, #+4			/* discard bet amount from stack */
	mov r1, #3			/* win payoff is X3 */
	mul r3, r0, r1			/* multiply bet amount by 3 */
	bal _spin_done

	_zero_double_zero:
	add sp, sp, #+4                 /* Discard the bet value we kept in the stack */
        add sp, sp, #+4                 /* Discard the bet amount we kept in the stack */
	mov r3, #0			/* coins won = 0 */

	_spin_done:

	mov r1, r3			/* move coins won into r1 */
        ldr lr, [sp], #+4               /* Pop the top of the stack and put it in lr */
        bx lr                           /* Leave main */

