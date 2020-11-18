module vector_top(clk, rst, rd1, rd2, rd3, rd4, wd1, wd2, wd3, wd4, alu_out, pc, instr);

	input logic clk, rst;
	
	output logic [31:0] rd1, rd2, rd3, rd4, wd1, wd2, wd3, wd4, alu_out, pc;
	output logic [29:0] instr;
	
	logic mem_wr_enable;
	logic [31:0] wr_addr;
	
	vector_cpu cpu(clk, rst, instr, rd1, rd2, rd3, rd4, pc,
						mem_wr_enable, wr_addr, alu_out, wd1, wd2, wd3, wd4);
	
	imem imem(pc, instr);
	
	dmem data_memory(clk, mem_wr_enable, wr_addr, wd1, wd2, wd3, wd4,
						rd1, rd2, rd3, rd4); 

endmodule
