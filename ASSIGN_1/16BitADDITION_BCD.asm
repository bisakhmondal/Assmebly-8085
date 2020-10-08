LXI H, 2500H;  Store 2500H in HL register pair, the first 16 bit number. 
LXI B, 2502H;   Store 2502H in BC register pair, the second 26 bit number.

MVI D, 00H; Initiate Carry Count.
LDAX B;  Load accumulator with content pointed by BC register pair.
ADD M; Add with Content pointed by HL pair
DAA; Decimal adjust after addition for BCD conversion

STA 2504H; Store the sum of first 8 bit to 2504H.

; Increment the HL and BC pair( Extended register pair).
INX H;
INX B;

LDAX B; Again Load accumulator with content pointed by BC register pair.
ADC M; Add with Content pointed by HL pair and the carry(if generated) by previous addition.
DAA; Decimal adjust after addition for BCD conversion
JNC NOCARRY; Check if any carry generated

INR D; Increase the carry count
NOCARRY: STA 2505H; Store the next 8 bit sum to 2505H
MOV A,D;  Move D(carry) to accumulator
STA 2506H; Store the result in 2500H 
HLT;
