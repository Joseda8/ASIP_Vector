module CPU_vector(clk, rst, pc, instr, instr_out, vec_alu_op,
							r_mem_1, r_mem_2, w_mem_2, w_mem_3,
							
							mulr1, mulr2, mulr3, mulr4, mulr5, mulr6, mulr7, mulr8, sumr1, sumr2, sumr3, sumr4, addr1, addr2, addr3, addr4);

	input logic clk, rst;
	input logic [29:0] instr;
	output logic [31:0] pc;
	
	output logic vec_alu_op;
	output logic r_mem_1, r_mem_2, w_mem_2, w_mem_3;
	output logic [29:0] instr_out;
	output logic [31:0] mulr1, mulr2, mulr3, mulr4, mulr5, mulr6, mulr7, mulr8, sumr1, sumr2, sumr3, sumr4, addr1, addr2, addr3, addr4;
	
	int flag;
	
		
	CPU_Datapath_ID datapath(clk, rst, instr, w_mem_2, w_mem_3, vec_alu_op, pc, instr_out, 
									mulr1, mulr2, mulr3, mulr4, mulr5, mulr6, mulr7, mulr8, sumr1, sumr2, sumr3, sumr4,
									addr1, addr2, addr3, addr4, flag);
									
	
	control_unit_ID controller(instr_out[29:26], vec_alu_op,
									r_mem_1,
									r_mem_2, w_mem_2,
									w_mem_3);
									
	
endmodule
