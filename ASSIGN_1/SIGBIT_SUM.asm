LDA 2500H; Load Content from 2500H into accumulator  
MOV D, A; keeping bakup due to multiple AND operation

ANI 00FH; AND operation with least 4 set bits( 0FH = 15( Decimal)= 00001111(Binary))

MOV B,A; Cache least 4 bits into B register

MOV A,D; Since content changed, load Accumulator freshly from backup

; 4 times ROTATE LEFT ACCUMULATOR to take 4 MSB into LSB
RLC;
RLC;
RLC;
RLC;

ANI 00FH; AND Immediate with 15 in decimal to get 4 most Significant bits

ADD B; Add 4bit MSB to 4 bit LSB 
STA 2550H; Store the result in 2550H
HLT;
