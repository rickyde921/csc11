.global div_mod
div_mod:

 str lr, [sp,#-4]!            /* Push lr onto the top of the stack */

MOV R0, #0 @Initializes  times divided to 0

_while_R2_ge_R3: @ while the dividen is greater than or equal to the divisor

CMP R2, R3
BLT _output @ exit loop if the Dividen is less than the divisor
SUB R2, R2, R3 @R2 = R2 - R3
ADD R0, #1
BAL _while_R2_ge_R3

_output:

/* r0 contains divided answer */
mov r1, r2
/* r1 contains remainder */

ldr lr, [sp], #+4            /* Pop the top of the stack and put it in lr */
    bx lr                        /* Leave main */
