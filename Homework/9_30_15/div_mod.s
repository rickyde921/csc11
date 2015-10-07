.global _start
_start:

    MOV R1, #65; @Dividend set to 63
    MOV R2, #4; @Divisor set to 4
    MOV R3, R1; @Copies dividend into R3 to avoid altering original data
    MOV R4, R2; @Sets R4 to the original divisor and will be used to shift
    MOV R5, #0; @Initializes times shifted to 0
    MOV R6, #1; @R6 will be used to perform squaring operations
    MOV R9, #0; @will contain the divided answer
	
    _while_R3_gt_R2:
    CMP R3,R2
    BLE _output
    
        _while_R3_gt_R4:
        CMP R3,R4
        BLE _before_if
            LSL R4,#1     @equivalent to Logical Shift Right
            ADD R5,R5,#1  @Adds time shifted by 1
        BAL _while_R3_gt_R4
    
        _before_if:
		CMP R5,#0
		BLE _after_if
            LSR R4,#1    @LSL to make the shifted divisor smaller than dividend
            SUB R5,R5,#1 @decrements the times shifted by 1 to account for unneeded shift

            SUB R3,R3,R4 @Subtracts the Mdivisor by max shifted dividend

            MOV R4,R2    @Reinitializes the shifted divisor to the original divisor

            LSR R6,R5
            
            ADD R9,R9, R6   @adds to final divided answer
            MOV R6,#1      @reinitializes to one to prepare for possible future shifts
            MOV R5,#0      @Reinitializes times shifted to 0

        _after_if:
   
    BAL _while_R3_gt_R2
	
	_output:
	
       @MOV R0, R9
       MOV R0, R3
	MOV R7,#1
	SWI 0
