.global _start
_start:

MOV R2, #16 @ Dividen

MOV R3, #3 @ Divisor

MOV R4, R2 @copy the dividen into register 4

_while_R4_ge_R3: @ while the dividen is greater than or equal to the divisor

CMP R4, R3
BLT _output @ exit loop if the Dividen is less than the divisor
SUB R4, R4, R3 @R4 = R4 - R3
BAL _while_R4_ge_R3

_output:
MOV R0, R4
MOV R7, #1
SWI 0
                                     

