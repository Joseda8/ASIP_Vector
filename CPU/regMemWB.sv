module regMemWB(clk, reset, v1alu_in, v2alu_in, v3alu_in, v4alu_in, v1mem_in, v2mem_in, v3mem_in, v4mem_in,
					 scalar_reg_wr_in, vec_reg_wr_wb_in, scalar_wmux_wb_in, vec_wmux_wb_in, vec_wfp_wb_in, 
					 scalar_alu_res_in, imm_wb_in,
					 
					 scalar_reg_wr_out, vec_reg_wr_wb_out, scalar_wmux_wb_out, vec_wmux_wb_out, vec_wfp_wb_out,
					 v1alu_out, v2alu_out, v3alu_out, v4alu_out, v1mem_out, v2mem_out, v3mem_out, v4mem_out, 
					 scalar_alu_res_out, imm_wb_out);
					 
	input logic clk, reset, scalar_reg_wr_in, vec_reg_wr_wb_in, scalar_wmux_wb_in, vec_wmux_wb_in, vec_wfp_wb_in;
	input logic [31:0] v1alu_in, v2alu_in, v3alu_in, v4alu_in, v1mem_in, v2mem_in, v3mem_in, 
								v4mem_in, scalar_alu_res_in, imm_wb_in;
	
	output logic scalar_reg_wr_out, vec_reg_wr_wb_out, scalar_wmux_wb_out, vec_wmux_wb_out, vec_wfp_wb_out;
	output logic [31:0] v1alu_out, v2alu_out, v3alu_out, v4alu_out, v1mem_out, v2mem_out, 
								v3mem_out, v4mem_out, scalar_alu_res_out, imm_wb_out;

	flopr #(1) scalar_reg_wr(clk, reset, scalar_reg_wr_in, scalar_reg_wr_out);
	flopr #(1) vec_reg_wr_wb(clk, reset, vec_reg_wr_wb_in, vec_reg_wr_wb_out);
	flopr #(1) scalar_wmux_wb(clk, reset, scalar_wmux_wb_in, scalar_wmux_wb_out);
	flopr #(1) vec_wmux_wb(clk, reset, vec_wmux_wb_in, vec_wmux_wb_out);
	flopr #(1) vec_wfp_wb(clk, reset, vec_wfp_wb_in, vec_wfp_wb_out);
	
	flopr #(32) v1alu(clk, reset, v1alu_in, v1alu_out);
	flopr #(32) v2alu(clk, reset, v2alu_in, v2alu_out);
	flopr #(32) v3alu(clk, reset, v3alu_in, v3alu_out);
	flopr #(32) v4alu(clk, reset, v4alu_in, v4alu_out);
	
	flopr #(32) v1mem(clk, reset, v1mem_in, v1mem_out);
	flopr #(32) v2mem(clk, reset, v2mem_in, v2mem_out);
	flopr #(32) v3mem(clk, reset, v3mem_in, v3mem_out);
	flopr #(32) v4mem(clk, reset, v4mem_in, v4mem_out);
	
	flopr #(32) scalar_alu_res(clk, reset, scalar_alu_res_in, scalar_alu_res_out);
	
	flopr #(32) imm_mem(clk, reset, imm_wb_in, imm_wb_out);

endmodule 