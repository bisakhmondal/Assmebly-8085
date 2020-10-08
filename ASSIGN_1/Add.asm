LDA 2200H ; Load Content from 2200H into accumulator 
MOV B, A; Move accumulator to B register

LDA 2201H; Load Content from 2201H into accumulator 
MVI C, 00; Reset C register for Carry

ADD B; Addition

JNC NOCARRY; check is carry is generated
INR C; Increment C register if CY is set
NOCARRY: STA 2202H; Store Sum into 2202H

MOV A, C; Move carry into accumulator

STA 2203H; Store Carry

HLT;
