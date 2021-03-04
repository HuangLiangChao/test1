



                PRESERVE8
                THUMB

; Vector Table Mapped to Address 0 at Reset
                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors
                EXPORT  __Vectors_End
                EXPORT  __Vectors_Size

__Vectors       DCD     0               ; Top of Stack
                DCD     Reset_Handler              ; Reset Handler

                                         
__Vectors_End

__Vectors_Size  EQU  __Vectors_End - __Vectors

                AREA    |.text|, CODE, READONLY

; Reset handler
Reset_Handler    PROC
                 EXPORT  Reset_Handler             [WEAK]
				;enable	GPIOF
				LDR R0,=0x40023800 + 0x30
				LDR R1,[R0]
				ORR R1,R1,#(1<<5)
				STR R1,[R0]
				
				;set GPIOF as output
				LDR R0,=0x40021400 + 0x00
				LDR R1,[R0]
				ORR R1,R1,#(1 << 2 * 9)
				STR R1,[R0]
				
				LDR R0,=0x40021400 + 0x08
				LDR R1,[R0]
				ORR R1,R1,#(3 << 2*9)
				STR R1,[R0]
				;set GPIOF output hight
				LDR R1,=0x40021400 + 0x18
GO				
				LDR R0,=1<<(16+9)
				STR R0,[R1]
				LDR R0,=0xfffff
				BL delay
				;get GPIOF outpout low
				LDR R0,=1<<9
				STR R0,[R1]
				LDR R0,=0xfffff
				BL delay
				
				B GO
                ENDP
delay
				SUBS R0,R0,#1
				BNE	delay
				MOV	PC,LR
					
                 END
					 