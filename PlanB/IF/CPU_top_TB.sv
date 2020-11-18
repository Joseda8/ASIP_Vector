module CPU_top_TB();

	logic clk, rst;
	logic [31:0] pc;
	logic [29:0] instr;
	
	CPU_top_IF uut(clk, rst, pc, instr);
	
	initial begin
	
	clk <= 1; rst <= 1;
	
	#5 rst <= 0;
	
	end
	
	always #5 clk = ~clk;

endmodule
