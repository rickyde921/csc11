	.global _start
_start:

MOV R1, #63 @ DIVIDEN places number 63 in register 1
MOV R2, #3 @ DIVISOR places number 3 in register 2
MOV R3, #0 @ Initializes divided answer to 0 in register 3
MOV R4, #0 @ Initializes the remainder to 0 in register 4
MOV R5,  R2 @Copies the Divisor onto register 5

CMP R1, R5

BGT _shift_to_scale
BAL done_shifting

_shift_to_scale:
LSR 


_done_shifting:


CMP  
