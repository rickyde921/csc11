.global _start
_start:

/*

Monday will be represented by #1
Tuesday will be represented by #2
Wednesday will be represented by #3
Thursday will be represented by $4
Friday will be represented by #4

*/

MOV R6, #0      @Will hold the place of today

MOV R6, #5      @Sets today equal to Friday. Can be changed if desired
CMP R6, #1
BEQ _class_csc11        @Will branch if day is Monday

CMP R6, #2
BEQ _class_csc5         @Will branch if day is Tuesday

CMP R6, #3
BEQ _class_csc11        @Will branch if day is Wednesday

CMP R6, #4
BEQ _class_csc5         @Will branch if day is Thursday

CMP R6, #5
BEQ _class_cis1         @Will branch if day is friday

BAL  _default 		@Default if no case is true

_class_csc11:
MOV R0, #11
BAL _output

_class_csc5:
MOV R0, #5      @Sets class to csc5
BAL _output

_class_cis1:
MOV R0, #1      @Sets class to CIS1
BAL _output

_default:
MOV R0, #0 	@Sets class to 0 for invalid input
@Dont need to branch to output because thats what gets executed next

_output:

MOV R7, #1
SWI 0

