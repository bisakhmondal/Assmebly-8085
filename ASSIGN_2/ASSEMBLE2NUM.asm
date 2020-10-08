LDA 2050H; Load Content of EA into Accumulator
ANI 00FH;AND operation with 4 set bits LSB ( 0FH = 15( Decimal)= 00001111(Binary)) to extract A

MOV C,A; Move the accumulator content to temporary C register.
LDA 2051H; Now Load the Content of BD into accumulator.

ANI 0F0H; AND Immediate with  Accumulator with value 4 bits set MSB to ertract B
ADD C; Add BH with AH

STA 2052H; Store the result into 2052H
HLT;
