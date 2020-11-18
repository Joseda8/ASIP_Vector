module CPU_top_IF(clk, rst, pc, instr);

	input logic clk, rst;
	
	output logic [31:0] pc;
	output logic [29:0] instr;
		
	CPU_vector_IF cpu(clk, rst, pc, instr);
	
	imem imem(pc, instr);

endmodule
