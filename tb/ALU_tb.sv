module ALU_tb();

logic [31:0] A, B, out;
logic [1:0] Func;
logic clk, C, Z, N, V, ready_add, ready_mul, busy_add, busy_mul;

ALU uut(A, B, Func, clk, C, Z, N, V, out, ready_add, ready_mul, busy_add, busy_mul);

initial begin

	clk = 1;
	
	# 15 A = 32'd845; B = 32'd100; Func = 2'b00; 
	# 50;
	
	# 15 A = 32'b01000010001101101100110011001101; B = 32'b01000000101100000000000000000000; Func = 2'b01; 
	# 50;
	
	#100;
	
	# 15 A = 32'd444; B = 32'd78; Func = 2'b10; 
	# 50;
	
	# 15 A = 32'b01000010001101101100110011001101; B = 32'b01000000101100000000000000000000; Func = 2'b11; 
	# 50;
	
	#100;
	
	# 15 A = 32'b01000010001101111100110011001101; B = 32'b01000000101100000000000100000000; Func = 2'b01; 
	# 50;
	
	#100;
	
	# 15 A = 32'd450; B = 32'd27; Func = 2'b10; 
	# 50;
	
	# 15 A = 32'b01000011000100110011001100110011; B = 32'b01000010001110101100110011001101; Func = 2'b01; 
	# 50;
	
	#100;


end

always #5 clk = ~clk;

endmodule
