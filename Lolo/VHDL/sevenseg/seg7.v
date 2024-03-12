module seg7(a,b,c,d,s);

	input wire a,b,c,d;
	output wire [6:0] s;
	
	reg[6:0] segments;
	
	assign s = segments;

	// 012_3456 (segmentsments are active-low)
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
	parameter F = 7'b000_1110; 

	always @(a,b,c,d)
	case ({a,b,c,d})
		0: segments = ZERO;
		1: segments = ONE;
		2: segments = TWO;
		3: segments = THREE;
		4: segments = FOUR;
		5: segments = FIVE;
		6: segments = SIX;
		7: segments = SEVEN;
		8: segments = EIGHT;
		9: segments = NINE;
		10: segments = A;
		11: segments = B;
		12: segments = C;
		13: segments = D;
		14: segments = E;
		15: segments = F;
	endcase


endmodule