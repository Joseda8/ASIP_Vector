module CPU_vector_IF(clk, rst, pc, instr);

	input logic clk, rst;
	input logic [29:0] instr;
	output logic [31:0] pc;
	
		
	CPU_DatapathID datapath(clk, rst, instr);

	
endmodule
