.global _start
_start:

MOV R0, #1 @Initializes output to 0
MOV R1, #63 @ SEts DIvidend to 63
MOV R2, #4 @Sets Divisor to 4
MOV R3, R1 @Copies Dividnend into R3 to avoid altering original data
MOV R4, R2 @Sets R4 to the original Divisor and will be used to shift
MOV R5, #0 @Initializes times shifted to 0
MOV R6, #1 @R6 will be used to perform squaring operations
MOV R8, #0 @R8 Will be used in for loops
MOV R9, #0 @Will contain the divided answer

_top:

CMP R3, R2

BGT _rdividend_gt_divisor @(remaining) dividend larger than divisor
BAL _output @else jump to output

_rdividend_gt_divisor:

CMP R3, R4 

BGT dividend_gt_sdivisor @original dividend larger than shifted divisor
BAL _if @else branch to if statement

dividend_gt_sdivisor:

LSR R4, #1 @Logical SHift Right
ADD R5, R5, #1 @Increments times shifted counter by 1

BAL _rdividend_gt_divisor @loops back to compare remaining dividend to divisor


_if: @tests if the times shifted counter is greater than 0

CMP R5, #0

BGT _if_true @if true, execute code
BAL _top @else, do not execute and begin first while loop

_if_true:

LSL R4, #1 @Shifts once back so shifted Divisor smaller than remaining Dividens
SUB R5, R5, #1 @Decrements times shifted counter

SUB R3, R3, R4 @Subtracts remaining DIvidend by max shifted DIvisor
MOV R4, R2 @Reinitializes the shifted Divisor to the original Divisor

_for_loop:

CMP R8, R5

BLT _square @will loop for every time shifted Divisor shifted
BAL _add @else add results

_square: 

LSR R6, #1 @squares for every time divisor was shifted to add to final answer
ADD R8, R8, #1 @Increment for loop counter

BAL _for_loop @loop again

_add: 

ADD R9, R9, R6 @Adds to final answer
MOV R8, #0 @Reinizializes for loop counter to 0

MOV R6, #1 @Reinitializes to one to prepeare for possible future shifts
MOV R5, #0 @Reinizializes times shifted to 0
BAL _top @loops back to first while loop to loop until done dividing

_output:

MOV R7, #1
SWI 0

@**********if you want to output modual, comment out first and execute second
MOV R0, R9 @ will output final divided answer
@MOV R0, R3 @will output remainder after division is complete
