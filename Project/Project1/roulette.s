
/* Main Program */

.data
/* 0 message */
.balign 4
	message0     : .asciz "Hello and Welcome!!! \n"
/* First message */
.balign 4
	message1     : .asciz " What would you like to bet on\n 1) Single Number\n 2) Even/Odd\n 3) Black/Red\n 4) Box\n 5) Column\n 6) Row\n 7) Terminate Program\n\n "
/* Second message */
.balign 4
	message2     : .asciz "Invalid Input \n"
/* THird message */
.balign 4
	message3    : .asciz "\n How many chips would you like to bet?\n Current chips = %d\n"
/* Fourth message */
.balign 4
	message4    : .asciz "You have won %d chips this round\n\n"
/* Single message */
.balign 4
	single_m     : .asciz "What number would you like to bet on? \n Enter the number 0-36 or enter 37 to bet on 00  \n"
/* Even Odd message */
.balign 4
	message_eo   : .asciz "What would you like to bet on? \n Enter 1 for odd numbers \n Enter 2 for even numbers \n"
/* Color message */
.balign 4
	message_c   : .asciz "What color would you like to bet on?\n Enter 1 for Red\n Enter 2 for Black\n"
/* Box message */
.balign 4
	message_b   : .asciz "What box would you like to bet on?\n 1) (Numbers 1-12)\n 2) (Numbers 13-24)\n 3) (Numbers 25-36)\n"
/* Column message */
.balign 4
	message_cl  : .asciz "What column would you like to bet on?\n 1) (1-3)\n 2) (4-6)\n 3) (7-9)\n 4) (10-12)\n 5) (13-15)\n 6) (16-18)\n 7) (19-21)\n 8) (22-24)\n 9) (25-27)\n 10) (28-30)\n 11) (31-33)\n 12) (34-36)\n" 
/* Row message */
.balign 4
	message_r   : .asciz "What row would you like to bet on?\n 1) (numbers 1,4,7,10,13,16,19,22,25,28,31,34)\n 2) (numbers 2,5,8,11,14,17,20,23,26,29,32,35)\n 3) (numbers 3,6,9,12,15,18,21,24,27,30,33,36)\n"
/*Spun message */
.balign 4
	message_spun : .asciz "\n ***Spinning***\n\n And the number is.....%d!!!\n"
/* Goodbye message */
.balign 4
	message_end  : .asciz "You left the table with %d chips\n Goodbye and thank you for playing roulette\n"

/* Format pattern for scanf */
.balign 4
	scan_pattern : .asciz "%d"
/* Where scanf will store the number read */
.balign 4
	number_read1  : .word 0
	number_read2  : .word 0
	number_read3  : .word 0
	number_spun   : .word 0
/* Returns for main and mult_by_5 */
.balign 4
	return       : .word 0


/* main function */
.global main
main:

	ldr r1, address_of_return       /* r1 <- &address_of_return */
	str lr, [r1]                    /* *r1 <- lr */

	ldr r0, address_of_message0	/* load welcome message */
	bl printf			/* call printf */
	
	mov r8, #100			/* Initialoze coins to 100 */

	_coin_check:
	cmp r8, #0			/* if coins are less than or equal to 0 */
	ble _goodbye			/* terminate program */
	
	_bet_type:
	ldr r0, address_of_message1     /* r0 <- &message1 */
	bl printf                       /* call to printf */

	ldr r0, address_of_scan_pattern /* load scan pattern */
	ldr r1, address_of_number_read1 /* where bet type variable will be stored */
	bl scanf			/* call scanf */

	ldr r0, address_of_number_read1
	ldr r0, [r0]			/* Load inputed value ontp r0 */

	cmp r0, #1
	blt _bad_bet_type		/* if input < 0 */
	cmp r0, #7
	bgt _bad_bet_type		/* if input > 6 */

	/* else */
	bal _good_bet_type		/* good input was provided */

	_bad_bet_type:
	ldr r0, address_of_message2	/* Load bad input message */
	bl printf			/* Call printf */
	bal _bet_type			/* Return bak to _bet_type and input again */

	_good_bet_type:			/* if good input was provided */

	/* Decide what question to ask */
	cmp r0, #1			/* if user chose to bet on a single number */
	beq _single
	cmp r0, #2			/* if user chose to bet on even or odd */
	beq _even_odd
	cmp r0, #3			/* if user chose to bet on a color */
	beq _color
	cmp r0, #4			/* if user chose to bet for a box */
	beq _box
	cmp r0, #5			/* if user chose to bet for a column */
	beq _column
	cmp r0, #6			/* if user chose to bet for a row */
	beq _row
	/*if 7 was inputed */
	bal _goodbye
	
	_single:
	ldr r0, address_of_single_m	/* Load single number message onto r0 */
	bl printf			/* call printf */

	ldr r0, address_of_scan_pattern	/* load scan pattern */
	ldr r1, address_of_number_read2	/* where bet value will be stored */
	bl scanf			/* call scanf */

	ldr r0, address_of_number_read2	/* load address of bet value */
	ldr r0, [r0] 			/* load in actual bet value onto r0 */

	cmp r0, #0			/* if bet value input is less than 0 */
	blt _bad_bet_value
	cmp r0, #37			/* if bet value input is more than 37 */
	bgt _bad_bet_value

	/* else */
	bal _bet_coin			/* continue and ask for bet amount */

	_bad_bet_value:
	ldr r0, address_of_message2	/*load invalid input message */
	bl printf			/* call printf */
	bal _single			/* go back to _single and repeat */


	_even_odd:
        ldr r0, address_of_message_eo   /* Load even odd  message onto r0 */
        bl printf                       /* call printf */

        ldr r0, address_of_scan_pattern /* load scan pattern */
        ldr r1, address_of_number_read2 /* where bet value will be stored */
        bl scanf                        /* call scanf */

        ldr r0, address_of_number_read2 /* load address of bet value */
        ldr r0, [r0]                    /* load in actual bet value onto r0 */

        cmp r0, #0                      /* if bet value input is less than or equal to 0 */
        ble _bad_bet_value_eo
        cmp r0, #2			/* if bet value is more than 2 */
        bgt _bad_bet_value_eo

        /* else */
        bal _bet_coin                   /* continue and ask for bet amount */

        _bad_bet_value_eo:
        ldr r0, address_of_message2     /*load invalid input message */
        bl printf                       /* call printf */
        bal _even_odd                   /* go back to _even_odd and repeat */

	_color:
        ldr r0, address_of_message_c    /* Load color  message onto r0 */
        bl printf                       /* call printf */

        ldr r0, address_of_scan_pattern /* load scan pattern */
        ldr r1, address_of_number_read2 /* where bet value will be stored */
        bl scanf                        /* call scanf */

        ldr r0, address_of_number_read2 /* load address of bet value */
        ldr r0, [r0]                    /* load in actual bet value onto r0 */

        cmp r0, #0                      /* if bet value input is less than or equal to 0 */
        ble _bad_bet_value_c
        cmp r0, #2			/* if bet value is greater than 2 */
        bgt _bad_bet_value_c

        /* else */
        bal _bet_coin                   /* continue and ask for bet amount */

        _bad_bet_value_c:
        ldr r0, address_of_message2     /*load invalid input message */
        bl printf                       /* call printf */
        bal _color                      /* go back to _color and repeat */

	 _box:
        ldr r0, address_of_message_b    /* Load even box  message onto r0 */
        bl printf                       /* call printf */

        ldr r0, address_of_scan_pattern /* load scan pattern */
        ldr r1, address_of_number_read2 /* where bet value will be stored */
        bl scanf                        /* call scanf */

        ldr r0, address_of_number_read2 /* load address of bet value */
        ldr r0, [r0]                    /* load in actual bet value onto r0 */

        cmp r0, #0                      /* if bet value input is less than or equal to 0 */
        ble _bad_bet_value_b
        cmp r0, #3                      /* if bet value is more than 3 */
        bgt _bad_bet_value_b

        /* else */
        bal _bet_coin                   /* continue and ask for bet amount */

        _bad_bet_value_b:
        ldr r0, address_of_message2     /*load invalid input message */
        bl printf                       /* call printf */
        bal _box                        /* go back to _box and repeat */

	_column:
        ldr r0, address_of_message_cl   /* Load column message onto r0 */
        bl printf                       /* call printf */

        ldr r0, address_of_scan_pattern /* load scan pattern */
        ldr r1, address_of_number_read2 /* where bet value will be stored */
        bl scanf                        /* call scanf */

        ldr r0, address_of_number_read2 /* load address of bet value */
        ldr r0, [r0]                    /* load in actual bet value onto r0 */

        cmp r0, #0                      /* if bet value input is less than or equal to 0 */
        ble _bad_bet_value_cl
        cmp r0, #12                     /* if bet value is more than 12 */
        bgt _bad_bet_value_cl

        /* else */
        bal _bet_coin                   /* continue and ask for bet amount */

        _bad_bet_value_cl:
        ldr r0, address_of_message2     /*load invalid input message */
        bl printf                       /* call printf */
        bal _column                     /* go back to _column and repeat */


	  _row:
        ldr r0, address_of_message_r    /* Load row message onto r0 */
        bl printf                       /* call printf */

        ldr r0, address_of_scan_pattern /* load scan pattern */
        ldr r1, address_of_number_read2 /* where bet value will be stored */
        bl scanf                        /* call scanf */

        ldr r0, address_of_number_read2 /* load address of bet value */
        ldr r0, [r0]                    /* load in actual bet value onto r0 */

        cmp r0, #0                      /* if bet value input is less than or equal to 0 */
        ble _bad_bet_value_r
        cmp r0, #3                      /* if bet value is more than 3 */
        bgt _bad_bet_value_r

        /* else */
        bal _bet_coin                   /* continue and ask for bet amount */

        _bad_bet_value_r:
        ldr r0, address_of_message2     /*load invalid input message */
        bl printf                       /* call printf */
        bal _row                        /* go back to _row and repeat */

	/* Ask how much coin the user will bet */

	_bet_coin:

	ldr r0, address_of_message3	/* load bet amount message */
	mov r1, r8			/* use user coins as the printf parameter */
	bl printf			/* call print */

	ldr r0, address_of_scan_pattern	/* load scan pattern */
	ldr r1, address_of_number_read3	/* where bet amount will be stored */
	bl scanf			/* call scanf */

	ldr r0, address_of_number_read3	/* load in value inputed for bet amount */
	ldr r0, [r0]

	cmp r0, #0			/* if bet amount is less than or equal to 0 */
	ble _bad_bet_amount
	cmp r0, r8			/* if bet amount is greater than chip amount */
	bgt _bad_bet_amount

	/* else */
	bal _good_bet_amount

	_bad_bet_amount:
	ldr r0, address_of_message2	/* load invlaid input message */
	bl printf			/* call printf */
	bal _bet_coin 			/* return to _bet_coin and ask again */

	_good_bet_amount:

	/* All 3 inputs are valid */

	/* calculate ranom spun number */
	mov r0,#0                    /* Set time(0) */
        bl time                      /* Call time */
	bl srand                     /* Call srand */
	bl rand                      /* Call rand */
	mov r1,r0,ASR #1             /* In case random return is negative */
	mov r2, r1			/* move random number into r2 */
	mov r3, #38			/* move number random number will be modded by */
	bl div_mod				/* Go to mod to find number 0-37 */
	/* After, r1 contains the number 0-37 */
	mov r9, r1			/* r9 will hold the number rolled */
	mov r1, r9			/* move number spun to printf parameter */
	ldr r0, address_of_message_spun
	bl printf			/* call printf */

	/* Move all 3 inputs user provided into registers 1-3 */
	ldr r3, address_of_number_read1	/* Load bet type onto r3 */
	ldr r3, [r3]
	ldr r2, address_of_number_read2	/* Load bet value onto r2 */
	ldr r2, [r2]
	ldr r1, address_of_number_read3	/* Load bet amount onto r1 */
	ldr r1, [r1]
	mov r0, r9			/* move into r0 the number spun */
	sub r8, r8, r1			/* total chips = total chips minus bet amount */
	bl spin_wheel			/* ***Spin Wheel*** */
	/* output coins won by previous bet */
	add r8, r8, r1   		/* add coins won to total coins */
	ldr r0, address_of_message4	/* load coins won message */
	bl printf			/* call printf */


	bal _coin_check			/* check if user still has coins by going back to top of program */

	_goodbye:
	mov r1, r8			/* move chip amount into printf parameter */
	ldr r0, address_of_message_end
	bl printf			/* call printf */

	ldr lr, address_of_return       /* lr <- &address_of_return */
	ldr lr, [lr]                    /* lr <- *lr */
bx lr   				/* return from main using lr */

/* References */
address_of_message0	 : .word message0
address_of_message1      : .word message1
address_of_message2      : .word message2
address_of_message3	 : .word message3
address_of_message4	 : .word message4
address_of_scan_pattern  : .word scan_pattern
address_of_number_read1  : .word number_read1
address_of_number_read2  : .word number_read2
address_of_number_read3  : .word number_read3
address_of_number_spun	 : .word number_spun
address_of_return        : .word return
address_of_single_m	 : .word single_m
address_of_message_eo	 : .word message_eo
address_of_message_c	 : .word message_c
address_of_message_b	 : .word message_b
address_of_message_cl	 : .word message_cl
address_of_message_r	 : .word message_r
address_of_message_spun  : .word message_spun
address_of_message_end	 : .word message_end
/* External */
.global printf
.global scanf
.global time
.global srand
.global rand
