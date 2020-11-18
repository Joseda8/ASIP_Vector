module CPU_top(clk, rst, pc, instr, instr_out, vec_alu_op, mulr1, mulr2, mulr3, mulr4, mulr5, mulr6, mulr7, mulr8, 
						sumr1, sumr2, sumr3, sumr4, addr1, addr2, addr3, addr4);

	input logic clk, rst;
	
	output logic [31:0] pc;
	output logic [29:0] instr, instr_out;
	output logic vec_alu_op;
	output logic [31:0] mulr1, mulr2, mulr3, mulr4, mulr5, mulr6, mulr7, mulr8, sumr1, sumr2, sumr3, sumr4, addr1, addr2, addr3, addr4;
	
	logic r_mem_1, r_mem_2, w_mem_2, w_mem_3;
		
	CPU_vector cpu(clk, rst, pc, instr, instr_out, vec_alu_op,
						r_mem_1, r_mem_2, w_mem_2, w_mem_3,
						mulr1, mulr2, mulr3, mulr4, mulr5, mulr6, mulr7, mulr8, sumr1, sumr2, sumr3, sumr4, 
						addr1, addr2, addr3, addr4);
	
	imem imem(pc, instr);

endmodule
