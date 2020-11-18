module vector_cpu(clk, rst, instr, rd1, rd2, rd3, rd4, pc, mem_wr_enable, wr_addr, alu_out, wd1, wd2, wd3, wd4,

						wr_sc);

	input logic clk, rst;
	input logic [29:0] instr;
	input logic [31:0] rd1, rd2, rd3, rd4;
	
	output logic mem_wr_enable, wr_sc;
	output logic [31:0] alu_out, wd1, wd2, wd3, wd4, wr_addr, pc;
	
	logic [29:0] instr_out;
	logic zero, mux_pc, sca_reg_w, vec_reg_w, sca_mux_exe, sca_alu_op;
	logic vec_alu_op, w_mem, r_mem, sca_reg_wd, vec_reg_wd, vec_reg_wfp;
	
	vector_datapath datapath(clk, rst, instr, rd1, rd2, rd3, rd4, mux_pc,
									sca_reg_w, vec_reg_w, sca_mux_exe,
									sca_alu_op, vec_alu_op, w_mem, r_mem,
									sca_reg_wd, vec_reg_wd, vec_reg_wfp,
									
	                        wd1, wd2, wd3, wd4, wr_addr, pc, alu_out, instr_out, zero, mem_wr_enable,
									
									wr_sc);

	
	control_unit controller(instr_out[29:26], zero, mux_pc, sca_reg_w,
									vec_reg_w, sca_mux_exe, sca_alu_op, vec_alu_op, 
									w_mem, r_mem, sca_reg_wd, vec_reg_wd, vec_reg_wfp);
	
endmodule
