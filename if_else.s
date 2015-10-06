.global _start
_start:

MOV R1, #1      @Day equal to Monday
MOV R2, #2      @Day equal to Tuesday
MOV R3, #3      @Day equal to Wednesday
MOV R4, #4      @Day equal to Thirsday
MOV R5, #5      @Day equal to Friday
MOV R6, #0      @Will hold the place of today

MOV R6, #2      @Sets today equal to Tuesday. Can be changed if desired
CMP R6, R1
BEQ _class_csc11        @if day is Monday

CMP R6, R2
BEQ _class_csc5         @else if day is Tuesday

CMP R6, R3
BEQ _class_csc11        @else if day is Wednesday

CMP R6, R4
BEQ _class_csc5         @else if day is Thursday

CMP R6, R5
BEQ _class_cis1         @else if day is friday

BAL _else	 	@else

_class_csc11:
MOV R0, #11	@Sets class to csc11
BAL _output

_class_csc5:
MOV R0, #5      @Sets class to csc5
BAL _output

_class_cis1:
MOV R0, #1      @Sets class to CIS1
BAL _output

_else:
MOV R0, #0 	@if day entered was not valid, return 0
BAL _output

_output:

MOV R7, #1
SWI 0

