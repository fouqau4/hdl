module test;

	reg [7:0] A, B, C;
	reg clk, rst;
	wire [15:0] D;
	
	Pipeline_unsigned_arithmetic m( clk, rst, A, B, C, D );
	
	initial
	begin 
		clk = 1'b0;
		forever #5 clk = ~clk;
		
	end
	
	initial
	begin
	#0
	rst = 1'b0;
	clk = 1'b0;	
	#5 
	rst = 1'b1;
	A = 8'b00000010;
	B = 8'b00000001;
	C = 8'b00000010;
	#10		
	A = 8'b00000001;
	B = 8'b00000010;
	C = 8'b00000110;
	
	#10
	A = 8'b00000011;
	B = 8'b00000110;
	C = 8'b00000011;
	
	#10
	A = 8'b00000010;
	B = 8'b00000011;
	C = 8'b00000010;
	
	#10
	A = 8'b00000001;
	B = 8'b00000010;
	C = 8'b00001010;
	#80
	$stop;
	end

endmodule
