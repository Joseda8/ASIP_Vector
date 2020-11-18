module vector_top_tb();

	logic clk, rst;
	logic [31:0] read_data, write_data, alu_out, pc;
	logic [29:0] instr;
	
	vector_top uut(clk, rst, read_data, write_data, alu_out, pc, instr);
	
	initial begin
	
	clk <= 1; rst <= 1;
	
	#5 rst <= 0;
	
	end
	
	always #5 clk = ~clk;

endmodule
