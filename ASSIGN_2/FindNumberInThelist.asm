LXI H, 2050H; Store 2050H in HL Register pair
LDA 204FH; Load content of 204FH (Number of elements N) in accumulator 
MOV B, A; Move N into B register

LDA 204EH; Load the Element that needs to be checked(if it present in the list or not) into the accumulator.
LOOP: CMP M; Compare the content pointed by Hl pair with accumulator.

JZ MATCHED; If zero flag is set it's a Match.
INX H; increment H
DCR B; Decresing N ( the number of Element)
JNZ LOOP; if Zero flag is set close loop

MVI A, 0FFH; Loop ended No match, Load FF into Accumulator.
STA 204DH; Store it into 204DH
HLT


MATCHED: SHLD 204DH; If match Found, Store HL Pair into 204DH and 204EH.
HLT
