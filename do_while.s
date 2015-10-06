.global _start
_start:

MOV R1, #1	@Initializes starting point of i
MOV R2, #10 	@Max value i will reach before ending
MOV R3, #0	@Totaal summation

_do:
ADD R3, R3, R1	@Adds current i to total
ADD R1, #1 	@Increments counter

CMP R1, R2 
BGT _done_looping

BAL _do

_done_looping:
MOV R0, R3 	@Moves total summation to R0
MOV R7, #1
SWI 0

