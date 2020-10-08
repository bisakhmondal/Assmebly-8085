LXI H, 2050H; Store 2050H in HL register pair, the m/m location where consecutive numbers are stored.
LDA 204FH; Load content of 204FH (Number of elements N) in accumulator  

MOV B, A; Move N into B register
XRA A; Exclusive or A with A to clear the content of Accumulator.

LOOP: CMP M; Compare Accumulator with the content pointer by HL register pair. 
JNC CARRYRESET; If carry is generated or CY is set then (M> A)
MOV A,M; Replace Accumulator with current Max
CARRYRESET: INX H; Increment the HL pair( Extended register pair)
DCR B; Decrement the counter( the N)
JNZ LOOP; if Zero flag is set N =0 exit loop

STA 204EH; Store Accumulator( The Max) into 204EH
HLT
