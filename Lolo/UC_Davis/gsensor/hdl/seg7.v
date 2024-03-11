module seg7 (input [3:0] in,output reg [6:0] display);

// 012_3456 (segments are active-low)
parameter ZERO = 7'b100_0000;
parameter ONE = 7'b111_1001;
parameter TWO = 7'b010_0100; 
parameter THREE = 7'b011_0000;
parameter FOUR = 7'b001_1001;
parameter FIVE = 7'b001_0010;
parameter SIX = 7'b000_0010; 
parameter SEVEN = 7'b111_1000; 
parameter EIGHT = 7'b000_0000; 
parameter NINE = 7'b001_0000; 
parameter A = 7'b000_1000;
parameter B = 7'b000_0011; 
parameter C = 7'b100_0110; 
parameter D = 7'b010_0001; 
parameter E = 7'b000_0110; 
parameter F = 7'b000_1011; 

always @(in)
case (in)
0: display = ZERO;
1: display = ONE;
2: display = TWO;
3: display = THREE;
4: display = FOUR;
5: display = FIVE;
6: display = SIX;
7: display = SEVEN;
8: display = EIGHT;
9: display = NINE;
10: display = A;
11: display = B;
12: display = C;
13: display = D;
14: display = E;
15: display = F;
endcase


endmodule