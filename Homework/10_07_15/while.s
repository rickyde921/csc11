.global _start
_start:

MOV R1, #1       @Initializes starting point of i
MOV R2, #10      @Max valye i will reach before edning
MOV R3, #0       @Total summation

_while_loop:

CMP R1, R2

BGT _done_looping

ADD R3, R3, R1	@Adds current i
ADD R1, R1, #1	@Increment counter by 1

BAL _while_loop

_done_looping:
 
MOV R0, R3

MOV R7, #1
SWI 0

