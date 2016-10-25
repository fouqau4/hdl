module Pipeline_unsigned_arithmetic (
  clk,
  reset_n,
  i_a,
  i_b,
  i_c,
  o_answer
);

input        clk, reset_n;
input  [7:0] i_a, i_b, i_c;
output [15:0] o_answer;

reg [7:0] r_a0;       // reg 4 i_a
reg [7:0] r_b0;       // reg 4 i_b
reg [7:0] r_c0;       // reg 4 i_c
reg [7:0] r_c1;       // reg 4 r_c0

reg [7:0] r_add;      // reg 4 a + b 
reg [15:0] r_mul;      // reg 4 ( a + b ) * c
reg [15:0] r_answer;   // reg 4 o_answer

always@(posedge clk or negedge reset_n) begin
  if (!reset_n) begin
    r_a0     <=  8'h00;
    r_b0     <=  8'h00;
    r_c0     <=  8'h00;
    r_c1     <=  8'h00;
    r_add    <=  8'h00;
	r_mul    <=  16'h0000;    
    r_answer <=  16'h0000;
  end
  else begin
    r_a0     <=  i_a;
    r_b0     <=  i_b;
    r_c0     <=  i_c;
    r_c1     <=  r_c0;
    r_add    <=  r_a0 + r_b0;
	r_mul    <=  r_c1 * r_add;
    r_answer <=  r_mul;
  end
end

assign o_answer = r_answer;

endmodule