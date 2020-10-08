LXI H, 2050H; Store 2050H in HL register pair, the m/m location where consecutive numbers are stored.
LDA 204FH;  Load content of 204FH (Number of elements N) in accumulator  

MOV B, A; Move N into B register
MOV A,M; Move First element (with the content pointer by HL register pair.) to Accumulator for start comparing.

LOOP: CMP M;  Compare Accumulator with the content pointer by HL register pair.

JC CARRYSET; If no carry is generated or CY is not set then (M< A)
MOV A,M;  Replace Accumulator with current Min
CARRYSET: INX H; Increment the HL pair( Extended register pair)

DCR B; Decrement the counter( the N)
JNZ LOOP; if Zero flag is set ie. N =0 exit loop

STA 204EH; Store Accumulator( The Min) into 204EH
HLT
