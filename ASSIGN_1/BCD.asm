LHLD 2200H; Load HL pair with direct addressing from memory

MVI C, 00H; Initiate C register with 0 for carry
MOV A, L; Load first byte from HL pair into Accumulator

ADD H; Addition with Second byte. 

DAA; Decimal adjust after addition for BCD conversion

JNC NOCARRY; check is carry is generated
INR C; Increment C register if CY is set

NOCARRY: STA 2202H; Store Sum into 2202H
MOV A,C;  Move carry into accumulator

STA 2203H; Store Carry

HLT;
