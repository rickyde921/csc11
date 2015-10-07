.global _start
_start:

MOV R1, #1	@Initializes starting point of i
MOV R2, #10 	@Max value i will reach before ending
MOV R3, #0	@Total summation

_for:
CMP R1, R2
BGT _done_looping

ADD R3, R3, R1 	@Add current i to total
ADD R1, #1 	@Increment counter

BAL _for

_done_looping:

MOV R0, R3	@Moves total summation to R0
MOV R7, #1
SWI 0

